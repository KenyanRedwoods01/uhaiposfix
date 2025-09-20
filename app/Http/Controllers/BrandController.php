<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Brand;
use Illuminate\Validation\Rule;
use App\Traits\TenantInfo;
use App\Traits\CacheForget;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class BrandController extends Controller
{
    use CacheForget;
    use TenantInfo;

    // Get the current admin's pos_accnt_id
    private function getCurrentPosAccntId()
    {
        return Auth::user()->pos_accnt_id;
    }

    public function index()
{
    // I switched back to Auth::user()->pos_accnt_id for consistency with the other fixes
    $posAccntId = Auth::user()->pos_accnt_id;

    // Added the filter so only brands tied to this account are fetched
    $lims_brand_all = Brand::where('is_active', true)
                           ->where('pos_accnt_id', $posAccntId)
                           ->get();

    // Fixed the mistake here — it was loading the "create" view instead of the "index" view
    return view('backend.brand.index', compact('lims_brand_all'));
}


    public function store(Request $request)
{
    // Clean up title input by trimming extra spaces
    $request->title = preg_replace('/\s+/', ' ', $request->title);

    // Validation: here I added the pos_accnt_id condition inside Rule::unique 
    // so uniqueness is checked per account, not globally
    $this->validate($request, [
        'title' => [
            'max:255',
            Rule::unique('brands')->where(function ($query) {
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', Auth::user()->pos_accnt_id); // switched to Auth for consistency
            }),
        ],
        // Kept the image validation rules the same
        'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
    ]);

    // Gather all fields except image
    $input = $request->except('image');

    // Ensure new brand is active by default
    $input['is_active'] = true;

    // Important: attach the pos_accnt_id so it belongs to the current account
    $input['pos_accnt_id'] = Auth::user()->pos_accnt_id;

    // If ecommerce addon is enabled, generate a slug from title
    if(in_array('ecommerce', explode(',', config('addons'))))
        $input['slug'] = Str::slug($request->title, '-');

    // Handle image upload
    $image = $request->image;
    if ($image) {
        $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
        $imageName = date("Ymdhis");

        // Different handling depending on whether multi-tenant DB is enabled
        if(!config('database.connections.saleprosaas_landlord')) {
            $imageName = $imageName . '.' . $ext;
            $image->move(public_path('images/brand'), $imageName);
        } else {
            $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
            $image->move(public_path('images/brand'), $imageName);
        }
        $input['image'] = $imageName;
    }

    // Finally, create the brand with validated input
    $brand = Brand::create($input);

    // Clear cached brand list so it refreshes with new entry
    $this->cacheForget('brand_list');

    // Support both ajax and standard requests
    if(isset($input['ajax']))
        return $brand;
    else 
        return redirect('brand')->with('message', 'Brand created successfully'); // added success message
}


    public function edit($id)
    {
        $pos_accnt_id = $this->getCurrentPosAccntId();
        $lims_brand_data = Brand::where('id', $id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->firstOrFail();
        return $lims_brand_data;
    }

    public function update(Request $request, $id)
{
    // First, grab the current account ID to enforce ownership
    $posAccntId = Auth::user()->pos_accnt_id;

    // Validation: I changed the ignore() to use $id instead of $request->brand_id
    // because the route parameter is the actual ID we’re updating
    $this->validate($request, [
        'title' => [
            'max:255',
            Rule::unique('brands')->ignore($id)->where(function ($query) use ($posAccntId) {
                // Ensure uniqueness is scoped by account
                return $query->where('is_active', 1)
                             ->where('pos_accnt_id', $posAccntId);
            }),
        ],
        'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
    ]);

    // Ownership check: only load brand that belongs to the same account
    $lims_brand_data = Brand::where('id', $id)
                            ->where('pos_accnt_id', $posAccntId)
                            ->firstOrFail();

    // Update main brand fields
    $lims_brand_data->title = $request->title;

    // If ecommerce addon is enabled, update extra fields
    if(in_array('ecommerce', explode(',', config('addons')))) {
        $lims_brand_data->page_title = $request->page_title;
        $lims_brand_data->short_description = $request->short_description;
    }

    // Handle image upload
    $image = $request->image;
    if ($image) {
        $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
        $imageName = date("Ymdhis");

        if(!config('database.connections.saleprosaas_landlord')) {
            $imageName = $imageName . '.' . $ext;
            $image->move(public_path('images/brand'), $imageName);
        } else {
            $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
            $image->move(public_path('images/brand'), $imageName);
        }
        $lims_brand_data->image = $imageName;
    }

    // Save the updates
    $lims_brand_data->save();

    // Clear cached brand list so changes take effect immediately
    $this->cacheForget('brand_list');

    // Redirect back with success message
    return redirect('brand')->with('message', 'Brand updated successfully');
}


    public function importBrand(Request $request)
    {
        $pos_accnt_id = $this->getCurrentPosAccntId();
        
        //get file
        $upload=$request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename =  $upload->getClientOriginalName();
        $filePath=$upload->getRealPath();
        //open and read
        $file=fopen($filePath, 'r');
        $header= fgetcsv($file);
        $escapedHeader=[];
        //validate
        foreach ($header as $key => $value) {
            $lheader=strtolower($value);
            $escapedItem=preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }
        //looping through othe columns
        while($columns=fgetcsv($file))
        {
            if($columns[0]=="")
                continue;
            foreach ($columns as $key => $value) {
                $value=preg_replace('/\D/','',$value);
            }
           $data= array_combine($escapedHeader, $columns);

           $brand = Brand::firstOrNew([
               'title' => $data['title'], 
               'is_active' => true,
               'pos_accnt_id' => $pos_accnt_id
           ]);
           $brand->title = $data['title'];
           $brand->image = $data['image'];
           $brand->is_active = true;
           $brand->pos_accnt_id = $pos_accnt_id;
           $brand->save();
        }
        $this->cacheForget('brand_list');
        return redirect('brand')->with('message', 'Brand imported successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $pos_accnt_id = $this->getCurrentPosAccntId();
        $brand_id = $request['brandIdArray'];
        
        foreach ($brand_id as $id) {
            $lims_brand_data = Brand::where('id', $id)
                                    ->where('pos_accnt_id', $pos_accnt_id)
                                    ->firstOrFail();
                                    
            if($lims_brand_data->image && !config('database.connections.saleprosaas_landlord') && file_exists('images/brand/'.$lims_brand_data->image)) {
                unlink('images/brand/'.$lims_brand_data->image);
            }
            elseif($lims_brand_data->image && file_exists('images/brand/'.$lims_brand_data->image)) {
                unlink('images/brand/'.$lims_brand_data->image);
            }
            $lims_brand_data->is_active = false;
            $lims_brand_data->save();
        }
        $this->cacheForget('brand_list');
        return 'Brand deleted successfully!';
    }

    public function destroy($id)
{
    // Always scope the brand to the current account to enforce ownership
    $posAccntId = Auth::user()->pos_accnt_id;

    // Only fetch the brand if it belongs to the current account
    $lims_brand_data = Brand::where('id', $id)
                            ->where('pos_accnt_id', $posAccntId)
                            ->firstOrFail();

    // Instead of hard-deleting, mark the brand as inactive
    $lims_brand_data->is_active = false;

    // If the brand has an image, remove it from storage (only if multi-tenant landlord not set)
    if ($lims_brand_data->image && !config('database.connections.saleprosaas_landlord') && file_exists('images/brand/'.$lims_brand_data->image)) {
        unlink('images/brand/'.$lims_brand_data->image);
    }
    // Fallback check in case landlord config is active
    elseif ($lims_brand_data->image && file_exists('images/brand/'.$lims_brand_data->image)) {
        unlink('images/brand/'.$lims_brand_data->image);
    }

    // Save the inactive state
    $lims_brand_data->save();

    // Forget cached brand list so UI updates immediately
    $this->cacheForget('brand_list');

    // Redirect with a clearer success message (previously it was flagged as "not_permitted")
    return redirect('brand')->with('message', 'Brand deleted successfully');
}

    /**
     * Added this method to handle brand search.
     * It’s scoped by pos_accnt_id so users only see their own brands.
     * Kept it lightweight: just filters by active status + query string.
     * Returns JSON for use in select2/autocomplete. 
     * Safe addition — won’t interfere with existing logic if unused.
     */
    public function limsBrandSearch(Request $request)
    {
        $posAccntId = $this->getCurrentPosAccntId();

        $brand_list = Brand::where([
                            ['title', 'LIKE', "%{$request->input('query')}%"],
                            ['is_active', true],
                            ['pos_accnt_id', $posAccntId]
                        ])->get();

        return response()->json($brand_list);
}

    public function exportBrand(Request $request)
    {
        $pos_accnt_id = $this->getCurrentPosAccntId();
        $lims_brand_data = $request['brandArray'];
        $csvData=array('Brand Title, Image');
        foreach ($lims_brand_data as $brand) {
            if($brand > 0) {
                $data = Brand::where('id', $brand)
                             ->where('pos_accnt_id', $pos_accnt_id)
                             ->first();
                             
                if ($data) {
                    $csvData[]=$data->title.','.$data->image;
                }
            }
        }
        $filename=date('Y-m-d').".csv";
        $file_path=public_path().'/downloads/'.$filename;
        $file_url=url('/').'/downloads/'.$filename;
        $file = fopen($file_path,"w+");
        foreach ($csvData as $exp_data){
          fputcsv($file,explode(',',$exp_data));
        }
        fclose($file);
        return $file_url;
    }
}
