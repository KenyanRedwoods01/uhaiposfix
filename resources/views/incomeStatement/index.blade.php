@extends('backend.layouts.app')

@section('content')
<div class="container">
    <a href="{{ url('/dashboard') }}" class="btn btn-secondary mb-3">← Back</a>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <h2>Sales Journal</h2>

    <div class="mb-3">
        <a href=" " class="btn btn-success">Export to Excel</a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover" id="sales-journal-table">
            <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>POS Accnt ID</th>
                    <th>Journal Date</th>
                    <th>Journal Description</th>
                    <th>Journal Amount</th>
                    <th>Journal Type</th>
                    <th>Journal Category</th>
                    <th>Journal Created At</th>
                </tr>
            </thead>
         
        </table>
    </div>
</div>
@endsection

@push('scripts')
<script>
    $(document).ready(function () {
        $('#sales-journal-table').DataTable({
            responsive: true,
            paging: true,
            searching: true,
            ordering: true,
        });
    });
</script>
@endpush
