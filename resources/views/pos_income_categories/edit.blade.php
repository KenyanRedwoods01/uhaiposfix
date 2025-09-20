@extends('backend.layouts.app')

@section('content')
<div class="container">
    <h2>Edit POS Income Category</h2>

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>@foreach($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
        </div>
    @endif

    <form action="{{ route('pos_income_categories.update', $category->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="name">Category Name:</label>
            <input type="text" class="form-control" name="name" value="{{ $category->name }}" required>
        </div>

        <button class="btn btn-primary mt-2" type="submit">Update</button>
        <a href="{{ route('pos_income_categories.index') }}" class="btn btn-secondary mt-2">Back</a>
    </form>
</div>
@endsection
