@extends('backend.layouts.app')

@section('content')
<div class="container">
    <h2>Add POS Income</h2>

    {{-- Back to Dashboard --}}
    <a href="{{ url('/dashboard') }}" class="btn btn-secondary mb-3">← Back</a>

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>@foreach($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
        </div>
    @endif

    <form action="{{ route('pos_incomes.store') }}" method="POST">
        @csrf

        <div class="row">
            {{-- Income Category --}}
            <div class="col-md-6">
                <div class="form-group">
                    <label for="category_id">Income Category:</label>
                    <select name="category_id" class="form-control" required>
                        <option value="">-- Select Category --</option>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            {{-- Amount --}}
            <div class="col-md-6">
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" step="0.01" name="amount" class="form-control" required>
                </div>
            </div>
        </div>

        <div class="row">
            {{-- Date --}}
            <div class="col-md-6">
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" name="date" class="form-control" required>
                </div>
            </div>

            {{-- Warehouse (Visible only for role_id <= 2) --}}
            <div class="col-md-6 mt-3 @if(\Auth::user()->role_id > 2) d-none @endif">
                <div class="form-group row">
                    <label class="col-form-label pr-2"><strong>{{ trans('file.Choose Warehouse') }}</strong></label>
                    <div class="col">
                        <select id="warehouse_id" name="warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins">
                            <option value="0">{{ trans('file.All Warehouse') }}</option>
                            @foreach($lims_warehouse_list as $warehouse)
                                <option value="{{ $warehouse->id }}" {{ isset($warehouse_id) && $warehouse->id == $warehouse_id ? 'selected' : '' }}>
                                    {{ $warehouse->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>

        {{-- Note --}}
        <div class="form-group">
            <label for="note">Note (optional):</label>
            <textarea name="note" class="form-control" rows="3"></textarea>
        </div>

        <button type="submit" class="btn btn-success mt-2">Add Income</button>
        <a href="{{ route('pos_incomes.index') }}" class="btn btn-secondary mt-2">Back</a>
    </form>
</div>
@endsection
