@extends('backend.layouts.app')

@section('content')
<div class="container">
    <h2>POS Income Categories</h2>

<a href="{{ url('/dashboard') }}" class="btn btn-secondary mb-3">← Back</a>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <a href="{{ route('pos_income_categories.create') }}" class="btn btn-primary mb-3">Add New Category</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Date Created</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        @forelse($categories as $key => $category)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $category->name }}</td>
                <td>{{ $category->created_at->format('d M, Y') }}</td>
                <td>
                    <a href="{{ route('pos_income_categories.edit', $category->id) }}" class="btn btn-sm btn-info">Edit</a>
                    <form action="{{ route('pos_income_categories.destroy', $category->id) }}" method="POST" style="display:inline-block;">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-sm btn-danger" onclick="return confirm('Delete this category?')">Delete</button>
                    </form>
                </td>
            </tr>
        @empty
            <tr><td colspan="4" class="text-center">No categories found.</td></tr>
        @endforelse
        </tbody>
    </table>
</div>
@endsection
