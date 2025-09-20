@extends('backend.layouts.app')

@section('content')
<div class="container">
    <h2>POS Income List</h2>

<a href="{{ url('/dashboard') }}" class="btn btn-secondary mb-3">← Back</a>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <a href="{{ route('pos_incomes.create') }}" class="btn btn-primary mb-3">Add New Income</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Warehouse</th>
                <th>Note</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        @forelse($incomes as $key => $income)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ optional($income->category)->name ?? 'N/A' }}</td>
                <td>{{ number_format($income->amount, 2) }}</td>
                <td>{{ \Carbon\Carbon::parse($income->date)->format('d M, Y') }}</td>
                <td>{{ optional($income->warehouse)->name ?? 'N/A' }}</td>
                <td>{{ $income->note }}</td>
                <td>
                    <a href="{{ route('pos_incomes.edit', $income->id) }}" class="btn btn-sm btn-info">Edit</a>
                    <form action="{{ route('pos_incomes.destroy', $income->id) }}" method="POST" style="display:inline-block;">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-sm btn-danger" onclick="return confirm('Delete this income?')">Delete</button>
                    </form>
                </td>
            </tr>
        @empty
            <tr><td colspan="7" class="text-center">No incomes found.</td></tr>
        @endforelse
        </tbody>
    </table>
</div>
@endsection
