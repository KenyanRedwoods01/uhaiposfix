@extends('backend.layouts.app')

@section('content')
<div class="container">
    <h2>Edit POS Income</h2>

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>@foreach($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
        </div>
    @endif

    <form action="{{ route('pos_incomes.update', $income->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="category_id">Income Category:</label>
            <select name="category_id" class="form-control" required>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" {{ $category->id == $income->category_id ? 'selected' : '' }}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label for="amount">Amount:</label>
            <input type="number" step="0.01" name="amount" value="{{ $income->amount }}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" name="date" value="{{ $income->date }}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="note">Note:</label>
            <textarea name="note" class="form-control" rows="3">{{ $income->note }}</textarea>
        </div>

        <button type="submit" class="btn btn-primary mt-2">Update Income</button>
        <a href="{{ route('pos_incomes.index') }}" class="btn btn-secondary mt-2">Back</a>
    </form>
</div>
@endsection
