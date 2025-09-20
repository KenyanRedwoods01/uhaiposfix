@extends('backend.layouts.app')

@section('content')
<div class="container">
    <a href="{{ url('/dashboard') }}" class="btn btn-secondary mb-3">← Back</a>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="container-fluid">
        <h3 class="text-center mt-3">Product Sales Data</h3>
        
        <?php
        // Get the logged in admin's pos_accnt_id
        $admin_pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Get filter parameters from request
        $filterStartDate = request('start_date');
        $filterEndDate = request('end_date');
        
        // Validate and set default dates if needed
        if (!$filterStartDate) {
            $filterStartDate = date('Y-m-d'); // Default to today
        }
        if (!$filterEndDate) {
            $filterEndDate = date('Y-m-d'); // Default to today
        }
        
        // Calculate today's totals from product_sales (for dashboard cards)
        $today = date('Y-m-d');
        $todayTotals = DB::table('product_sales')
            ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
            ->select(
                DB::raw('COUNT(*) as total_items_sold'),
                DB::raw('SUM(product_sales.qty) as total_quantity'),
                DB::raw('SUM(product_sales.total) as total_sales_amount'),
                DB::raw('AVG(product_sales.net_unit_price) as avg_unit_price')
            )
            ->where('sales.pos_accnt_id', '=', $admin_pos_accnt_id)
            ->whereDate('sales.created_at', $today)
            ->first();
            
        // Calculate today's profit/loss
        $todayProfitLoss = DB::table('product_sales')
            ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
            ->join('products', 'product_sales.product_id', '=', 'products.id')
            ->select(
                DB::raw('SUM(product_sales.total - (products.cost * product_sales.qty)) as total_profit_loss')
            )
            ->where('sales.pos_accnt_id', '=', $admin_pos_accnt_id)
            ->whereDate('sales.created_at', $today)
            ->first();
            
        // Get product sales data with filters - UPDATED to include cost
        $productSalesQuery = DB::table('product_sales')
            ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
            ->join('products', 'product_sales.product_id', '=', 'products.id')
            ->select(
                'product_sales.sale_id',
                'product_sales.product_id',
                'products.name as product_name',
                'products.code as product_code',
                'products.cost as product_cost', // Added cost column
                'product_sales.qty',
                'product_sales.net_unit_price',
                'product_sales.total',
                'sales.created_at as sale_date'
            )
            ->where('sales.pos_accnt_id', '=', $admin_pos_accnt_id)
            ->whereDate('sales.created_at', '>=', $filterStartDate)
            ->whereDate('sales.created_at', '<=', $filterEndDate)
            ->orderBy('sales.created_at', 'desc')
            ->orderBy('product_sales.sale_id', 'desc');
            
        // Get paginated results
        $productSales = $productSalesQuery->paginate(20)->appends(request()->query());
        
        // Calculate filtered totals including profit/loss
        $filteredTotals = DB::table('product_sales')
            ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
            ->join('products', 'product_sales.product_id', '=', 'products.id')
            ->select(
                DB::raw('COUNT(*) as total_items'),
                DB::raw('SUM(product_sales.qty) as total_quantity'),
                DB::raw('SUM(product_sales.total) as total_amount'),
                DB::raw('SUM(product_sales.total - (products.cost * product_sales.qty)) as total_profit_loss')
            )
            ->where('sales.pos_accnt_id', '=', $admin_pos_accnt_id)
            ->whereDate('sales.created_at', '>=', $filterStartDate)
            ->whereDate('sales.created_at', '<=', $filterEndDate)
            ->first();
            
        // Update PosIncome with current profit/loss data (filtered by pos_accnt_id)
        $userId = Auth::id();
        $userPosAccntId = Auth::user()->pos_accnt_id;
        
        // Calculate total profit/loss for this specific user's pos_accnt_id
        $userTotalProfitLoss = DB::table('product_sales')
            ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
            ->join('products', 'product_sales.product_id', '=', 'products.id')
            ->select(
                DB::raw('SUM(product_sales.total - (products.cost * product_sales.qty)) as total_profit_loss')
            )
            ->where('sales.pos_accnt_id', '=', $userPosAccntId)
            ->first();
            
        $salesIncomeCategory = \App\Models\PosIncomeCategory::where('user_id', $userId)
            ->where('name', 'SALES INCOME')
            ->first();
            
        if ($salesIncomeCategory) {
            $salesIncomeJournal = \App\Models\PosIncome::where('user_id', $userId)
                ->where('category_id', $salesIncomeCategory->id)
                ->where('note', 'SALES INCOME JOURNAL')
                ->first();
                
            if ($salesIncomeJournal) {
                $salesIncomeJournal->update([
                    'amount' => $userTotalProfitLoss->total_profit_loss ?? 0.00,
                ]);
            }
        }
        ?>

        <!-- Dashboard Cards -->
        <div class="row g-3 mb-4">
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h3 class="text-primary">{{ number_format($todayTotals->total_items_sold ?? 0) }}</h3>
                        <p class="text-muted mb-0">Items Sold Today</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h3 class="text-success">{{ number_format($todayTotals->total_quantity ?? 0) }}</h3>
                        <p class="text-muted mb-0">Total Quantity Today</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h3 class="text-info">KES{{ number_format($todayTotals->total_sales_amount ?? 0, 2) }}</h3>
                        <p class="text-muted mb-0">Sales Amount Today</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h3 class="{{ ($todayProfitLoss->total_profit_loss ?? 0) >= 0 ? 'text-success' : 'text-danger' }}">
                            KES{{ number_format($todayProfitLoss->total_profit_loss ?? 0, 2) }}
                        </h3>
                        <p class="text-muted mb-0">Profit/Loss Today</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filter Form -->
        <div class="card mb-4">
            <div class="card-body">
                <form method="GET" action="">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-4">
                            <label for="start_date" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="start_date" name="start_date" 
                                   value="{{ $filterStartDate }}">
                        </div>
                        <div class="col-md-4">
                            <label for="end_date" class="form-label">End Date</label>
                            <input type="date" class="form-control" id="end_date" name="end_date" 
                                   value="{{ $filterEndDate }}">
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary me-2">Filter</button>
                            <a href="{{ url()->current() }}" class="btn btn-outline-secondary">Reset</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Summary Cards for Filtered Data -->
        <div class="row g-3 mb-4">
            <div class="col-md-3">
                <div class="card text-center bg-light">
                    <div class="card-body">
                        <h4 class="text-primary">{{ number_format($filteredTotals->total_items ?? 0) }}</h4>
                        <p class="text-muted mb-0">Total Items (Filtered Period)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-light">
                    <div class="card-body">
                        <h4 class="text-success">{{ number_format($filteredTotals->total_quantity ?? 0) }}</h4>
                        <p class="text-muted mb-0">Total Quantity (Filtered Period)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-light">
                    <div class="card-body">
                        <h4 class="text-info">KES{{ number_format($filteredTotals->total_amount ?? 0, 2) }}</h4>
                        <p class="text-muted mb-0">Total Amount (Filtered Period)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-light">
                    <div class="card-body">
                        <h4 class="{{ ($filteredTotals->total_profit_loss ?? 0) >= 0 ? 'text-success' : 'text-danger' }}">
                            KES{{ number_format($filteredTotals->total_profit_loss ?? 0, 2) }}
                        </h4>
                        <p class="text-muted mb-0">Total Profit/Loss (Filtered Period)</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Sales Table -->
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Product Sales Details ({{ $filterStartDate }} to {{ $filterEndDate }})</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Sale ID</th>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Cost Price</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Total</th>
                                <th>Profit/Loss</th>
                                <th>Sale Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($productSales as $item)
                            <?php
                                // Calculate profit/loss per item
                                $totalCost = $item->product_cost * $item->qty;
                                $profitLoss = $item->total - $totalCost;
                                $profitLossClass = $profitLoss >= 0 ? 'text-success' : 'text-danger';
                            ?>
                            <tr>
                                <td><strong>#{{ $item->sale_id }}</strong></td>
                                <td>{{ $item->product_code }}</td>
                                <td>{{ $item->product_name }}</td>
                                <td>KES{{ number_format($item->product_cost, 2) }}</td>
                                <td><span class="badge bg-primary">{{ number_format($item->qty) }}</span></td>
                                <td>KES{{ number_format($item->net_unit_price, 2) }}</td>
                                <td><strong>KES{{ number_format($item->total, 2) }}</strong></td>
                                <td class="{{ $profitLossClass }}">
                                    <strong>KES{{ number_format($profitLoss, 2) }}</strong>
                                </td>
                                <td>{{ date('d M Y H:i', strtotime($item->sale_date)) }}</td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="9" class="text-center py-4">
                                    <div class="text-muted">
                                        <i class="fas fa-inbox fa-3x mb-3"></i>
                                        <p>No product sales found for the selected date range.</p>
                                    </div>
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                        @if($productSales->count() > 0)
                        <tfoot>
                            <tr>
                                <th colspan="4">Page Total:</th>
                                <th>{{ number_format($productSales->sum('qty')) }}</th>
                                <th>-</th>
                                <th>KES{{ number_format($productSales->sum('total'), 2) }}</th>
                                <th class="{{ ($productSales->sum('total') - $productSales->sum(function($item) { return $item->product_cost * $item->qty; })) >= 0 ? 'text-success' : 'text-danger' }}">
                                    KES{{ number_format($productSales->sum('total') - $productSales->sum(function($item) { return $item->product_cost * $item->qty; }), 2) }}
                                </th>
                                <th>-</th>
                            </tr>
                        </tfoot>
                        @endif
                    </table>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted">
                        Showing {{ $productSales->firstItem() ?? 0 }} to {{ $productSales->lastItem() ?? 0 }} 
                        of {{ $productSales->total() }} results
                    </div>
                    <div>
                        {{ $productSales->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

<style>
.card {
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    border: none;
    border-radius: 8px;
}

.card-body h3, .card-body h4 {
    margin: 0;
    font-weight: bold;
}

.table tfoot th {
    background-color: #e9ecef;
    font-weight: bold;
}

.text-muted {
    font-size: 0.875rem;
}

/* Pagination styling */
.pagination {
    margin: 0;
}

.pagination .page-link {
    font-size: 14px;
    padding: 0.375rem 0.75rem;
    color: #007bff;
    border: 1px solid #dee2e6;
}

.pagination .page-item.active .page-link {
    background-color: #007bff;
    border-color: #007bff;
    color: white;
}

.pagination .page-link:hover {
    color: #0056b3;
    text-decoration: none;
    background-color: #e9ecef;
    border-color: #dee2e6;
}

.pagination .page-item.disabled .page-link {
    color: #6c757d;
    pointer-events: none;
    background-color: #fff;
    border-color: #dee2e6;
}

/* Filter form styling */
.form-label {
    font-weight: 600;
    margin-bottom: 0.5rem;
}

.btn {
    font-weight: 500;
}

.me-2 {
    margin-right: 0.5rem !important;
}

.d-flex {
    display: flex !important;
}

.align-items-end {
    align-items: flex-end !important;
}

.justify-content-between {
    justify-content: space-between !important;
}

.align-items-center {
    align-items: center !important;
}

.g-3 > * {
    padding: 0.75rem;
}

.row.g-3 {
    margin: -0.75rem;
}

/* Table styling */
.table-responsive {
    border-radius: 8px;
    overflow: hidden;
}

.badge {
    font-size: 0.8em;
}

/* Card hover effect */
.card:hover {
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    transition: box-shadow 0.3s ease;
}

/* Empty state styling */
.fas {
    color: #6c757d;
}

/* Profit/Loss styling */
.text-success {
    color: #198754 !important;
}

.text-danger {
    color: #dc3545 !important;
}

/* Responsive pagination */
@media (max-width: 768px) {
    .pagination {
        font-size: 12px;
    }
    
    .pagination .page-link {
        padding: 0.25rem 0.5rem;
    }
    
    .d-flex.justify-content-between {
        flex-direction: column;
        gap: 1rem;
    }
}
</style>