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
        $pos_accnt_id = $this->getCurrentPosAccntId();
        $lims_brand_all = Brand::where('is_active', true)
                               ->where('pos_accnt_id', $pos_accnt_id)
                               ->get();
        return view('backend.brand.create', compact('lims_brand_all'));
    }

    public function store(Request $request)
    {
        $request->title = preg_replace('/\s+/', ' ', $request->title);
        $this->validate($request, [
            'title' => [
                'max:255',
                    Rule::unique('brands')->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', $this->getCurrentPosAccntId());
                }),
            ],

            'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        ]);

        $input = $request->except('image');
        $input['is_active'] = true;
        $input['pos_accnt_id'] = $this->getCurrentPosAccntId();
        
        if(in_array('ecommerce', explode(',',config('addons'))))
            $input['slug'] = Str::slug($request->title, '-');
        $image = $request->image;
        if ($image) {
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $imageName = $imageName . '.' . $ext;
                $image->move(public_path('images/brand'),$imageName);
            }
            else {
                $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
                $image->move(public_path('images/brand'),$imageName);
            }
            $input['image'] = $imageName;
        }
        $brand = Brand::create($input);
        $this->cacheForget('brand_list');

        if(isset($input['ajax']))
            return $brand;
        else 
            return redirect('brand');
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
        $pos_accnt_id = $this->getCurrentPosAccntId();
        
        $this->validate($request, [
            'title' => [
                'max:255',
                    Rule::unique('brands')->ignore($request->brand_id)->where(function ($query) {
                    return $query->where('is_active', 1)
                                 ->where('pos_accnt_id', $this->getCurrentPosAccntId());
                }),
            ],

            'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        ]);
        
        $lims_brand_data = Brand::where('id', $request->brand_id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->firstOrFail();
                                
        $lims_brand_data->title = $request->title;
        if(in_array('ecommerce', explode(',',config('addons')))) {
            $lims_brand_data->page_title = $request->page_title;
            $lims_brand_data->short_description = $request->short_description;
        }
        $image = $request->image;
        if ($image) {
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $imageName = $imageName . '.' . $ext;
                $image->move(public_path('images/brand'),$imageName);
            }
            else {
                $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
                $image->move(public_path('images/brand'),$imageName);
            }
            $lims_brand_data->image = $imageName;
        }
        $lims_brand_data->save();
        $this->cacheForget('brand_list');
        return redirect('brand');
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
        $pos_accnt_id = $this->getCurrentPosAccntId();
        $lims_brand_data = Brand::where('id', $id)
                                ->where('pos_accnt_id', $pos_accnt_id)
                                ->firstOrFail();
                                
        $lims_brand_data->is_active = false;
        if($lims_brand_data->image && !config('database.connections.saleprosaas_landlord') && file_exists('images/brand/'.$lims_brand_data->image)) {
            unlink('images/brand/'.$lims_brand_data->image);
        }
        elseif($lims_brand_data->image && file_exists('images/brand/'.$lims_brand_data->image)) {
            unlink('images/brand/'.$lims_brand_data->image);
        }
        $lims_brand_data->save();
        $this->cacheForget('brand_list');
        return redirect('brand')->with('not_permitted', 'Brand deleted successfully!');
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