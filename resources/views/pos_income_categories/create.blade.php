@extends('backend.layouts.app')

@section('content')
<div class="container">
    <h2>Add POS Income Category</h2>

    {{-- Back to Dashboard --}}
    <a href="{{ url('/dashboard') }}" class="btn btn-secondary mb-3">← Back</a>

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>@foreach($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
        </div>
    @endif

    <form action="{{ route('pos_income_categories.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="name">Category Name:</label>
            <input type="text" class="form-control" name="name" required>
        </div>

        <button class="btn btn-success mt-2" type="submit">Create</button>
        <a href="{{ route('pos_income_categories.index') }}" class="btn btn-secondary mt-2">Back</a>
    </form>
</div>
@endsection
