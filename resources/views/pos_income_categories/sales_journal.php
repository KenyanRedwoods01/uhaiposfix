@extends('backend.layout.main')

@section('content')

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">

                {{-- Success message --}}
                @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session()->get('message') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif

                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Sales Journal</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Date</th>
                                    <th>Customer</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($sales as $sale)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $sale['date'] }}</td>
                                    <td>{{ $sale['customer'] }}</td>
                                    <td>${{ number_format($sale['amount'], 2) }}</td>
                                </tr>
                                @endforeach

                                @if(count($sales) == 0)
                                <tr>
                                    <td colspan="4" class="text-center text-muted">No sales records found.</td>
                                </tr>
                                @endif
                            </tbody>
                        </table>
                    </div> <!-- /.card-body -->
                </div> <!-- /.card -->

            </div>
        </div>
    </div>
</div>

@endsection
