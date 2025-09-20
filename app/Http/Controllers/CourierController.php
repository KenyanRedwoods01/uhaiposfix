<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Courier;
use Illuminate\Support\Facades\Auth;

class CourierController extends Controller
{
    public function index()
    {
        // Fetch the logged-in user's pos_accnt_id
        $posAccntId = Auth::user()->pos_accnt_id;

        // Fetch couriers whose pos_accnt_id matches the logged-in user's pos_accnt_id
        $lims_courier_all = Courier::where('is_active', true)
            ->where('pos_accnt_id', $posAccntId)  // Filter by pos_accnt_id
            ->orderBy('id', 'desc')
            ->get();

        return view('backend.courier.index', compact('lims_courier_all'));
    }

    public function create()
    {
        //
    }

public function store(Request $request)
{
    // Fetch the logged-in user's pos_accnt_id
    $posAccntId = Auth::user()->pos_accnt_id;

    // Set the pos_accnt_id for the courier being created to match the logged-in admin's pos_accnt_id
    $request->merge(['pos_accnt_id' => $posAccntId]);

    // Create the new courier record
    Courier::create($request->all());

    return redirect()->back()->with('message', 'Courier created successfully');
}


    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        Courier::find($request->id)->update($request->all());
        return redirect()->back()->with('message', 'Courier updated successfully');
    }

    public function destroy($id)
    {
        Courier::find($id)->update(['is_active' => false]);
        return redirect()->back()->with('not_permitted', 'Courier deleted successfully');
    }
}
