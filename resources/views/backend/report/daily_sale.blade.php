@extends('backend.layout.main')
@section('content')

<section>
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <!-- Date Filter Form -->
                <form method="GET" action="">
                    <div class="form-group">
                        <label for="filter_date">Filter by Date:</label>
                        <input type="date" name="filter_date" id="filter_date" class="form-control" value="{{ request()->get('filter_date', \Carbon\Carbon::today()->toDateString()) }}">
                    </div>
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <button id="downloadPdf" class="btn btn-success ml-8">Download PDF</button>
                </form>

                <table class="table table-bordered mt-4" id="salesTable">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            use Carbon\Carbon;

                            // Get the selected date from the request, or default to today's date
                            $selectedDate = request()->get('filter_date', Carbon::today()->toDateString());
                            
                            // Get the logged in admin's pos_accnt_id
                            $adminPosAccntId = Auth::user()->pos_accnt_id;

                            // Fetch data based on the selected date AND admin's pos_accnt_id
                            $salesData = DB::table('product_sales')
                                ->join('products', 'product_sales.product_id', '=', 'products.id')
                                ->select('products.name', 'product_sales.qty', 'product_sales.total')
                                ->whereDate('product_sales.created_at', '=', $selectedDate)
                                ->where('product_sales.pos_accnt_id', '=', $adminPosAccntId) // Filter by pos_accnt_id
                                ->get();

                            // Calculate the sum of qty and total
                            $totalQty = $salesData->sum('qty');
                            $totalAmount = $salesData->sum('total');
                        @endphp
                        @foreach($salesData as $sale)
                            <tr>
                                <td>{{ $sale->name }}</td>
                                <td>{{ $sale->qty }}</td>
                                <td>{{ $sale->total }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <td><strong>Total</strong></td>
                            <td><strong>{{ $totalQty }}</strong></td>
                            <td><strong>{{ $totalAmount }}</strong></td>
                        </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
<script type="text/javascript">

    // Ensure to include the jsPDF library for the download functionality
    $("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #daily-sale-report-menu").addClass("active");

    $('#warehouse_id').val($('input[name="warehouse_id_hidden"]').val());
    $('.selectpicker').selectpicker('refresh');

    $('#warehouse_id').on("change", function(){
        $('#report-form').submit();
    });

// Download PDF functionality
document.getElementById('downloadPdf').addEventListener('click', function () {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // Add Title to the PDF (centered)
    const title = 'Product Report';
    const pageWidth = doc.internal.pageSize.getWidth();
    const titleWidth = doc.getTextWidth(title);
    const titleX = (pageWidth - titleWidth) / 2; // Center the title
    doc.setFontSize(18);
    doc.text(title, titleX, 20);

    // Capture the table and add it to the PDF
    const table = document.getElementById('salesTable');

    // Add the table data to the PDF
    doc.autoTable({
        html: table,
        startY: 30, // Positioning the table after the title
        headStyles: { fillColor: [0, 123, 255] }, // Optional: table header color
        margin: { top: 30 }, // Adjust margins for better positioning
        theme: 'grid', // Set table theme to grid
    });

    doc.setFontSize(12); // Set font size to 12

    // Add RECEIVED BY and SIGNED BY sections
    doc.text('RECEIVED BY: ______________________________', 14, doc.lastAutoTable.finalY + 10);
    doc.text('SIGNED BY: ______________________________', 14, doc.lastAutoTable.finalY + 20);

    // Save the PDF
    doc.save('sales_report.pdf');
});

</script>
@endpush
<!-- Include jsPDF library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<!-- Include autoTable plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.14/jspdf.plugin.autotable.min.js"></script>