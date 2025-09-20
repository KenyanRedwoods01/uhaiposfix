@extends('backend.layout.main') @section('content')

@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif


<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">

<div class="card">
    <div class="card-header d-flex align-items-center">
        <h4>Loyalty Points</h4>
    </div>
    <div class="card-body">
        <!-- Fetch the active tax rates from the taxes table -->
    @php
    $taxRates = DB::table('taxes')
        ->where('is_active', 1) // Only fetch records where is_active is 1
        ->select('rate', 'name')
        ->get();


        // Fetch active accounts from the accounts table
$activeAccounts = DB::table('accounts')
    ->where('is_active', 1)
    ->select('account_no', 'name')
    ->get();
        
$salesCustomerData = DB::table('sales')
    ->join('customers', 'sales.customer_id', '=', 'customers.id')
    ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
    ->join('products', 'product_sales.product_id', '=', 'products.id')
    ->select(
        'sales.id',
        'sales.customer_id',
        'customers.name as customer_name',
        'customers.MemberNo',
        'customers.phone_number',
        'product_sales.qty',
        'product_sales.created_at',
        'products.name as product_name',
        DB::raw('products.price * product_sales.qty as total_price'),
        DB::raw('products.cost * product_sales.qty as total_cost'),
        DB::raw('(products.price * product_sales.qty) - (products.cost * product_sales.qty) as profit')
    )
    ->get();

// Calculate the total profit for each customer
$customerTotalPoints = DB::table('sales')
    ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
    ->join('products', 'product_sales.product_id', '=', 'products.id')
    ->select(
        'sales.customer_id',
        DB::raw('SUM((products.price * product_sales.qty) - (products.cost * product_sales.qty)) as total_profit')
    )
    ->groupBy('sales.customer_id')
    ->get();


    // Insert the profit values into the customers' LoyaltyPoints column
// Insert the total points into the customers' LoyaltyPoints column
foreach ($salesCustomerData as $record) {
    // Fetch the total points for each customer
    $totalPoints = $customerTotalPoints->firstWhere('customer_id', $record->customer_id)->total_profit ?? 0;

    // Update the customer's LoyaltyPoints with the fetched total points value
    DB::table('customers')
        ->where('id', $record->customer_id)
        ->update(['LoyaltyPoints' => $totalPoints]); // Update LoyaltyPoints with the total points value
}

@endphp


        <!-- Display the customer, sales, product_name, total_cost, total_price, profit, and tax operations data in a table -->
       <table class="table table-bordered">
    <thead>
    <tr>
        <th style="display:none;">{{ trans('file.Sale ID') }}</th> <!-- Hidden column -->
        <th style="display:none;">{{ trans('file.Customer ID') }}</th> <!-- Hidden column -->
        <th>Customer Name</th>
        <th>{{ trans('file.Product Name') }}</th>
        <th>{{ trans('file.Quantity') }}</th>
        <th>{{ trans('file.Total Price') }}</th>
        <th>{{ trans('file.Total Cost') }}</th>
        <th>{{ trans('file.Profit') }}</th>
        <th>{{ trans('file.Created At') }}</th>
        <th style="display:none;">{{ trans('file.Tax Operations') }}</th> <!-- Hidden column -->
        <th>Total Points</th> <!-- New column for Total Points -->
        <th>{{ trans('file.Download') }}</th>
    </tr>
</thead>
<tbody>
    @foreach($salesCustomerData as $record)
        <tr>
            <td style="display:none;">{{ $record->id }}</td> <!-- Hidden cell -->
            <td style="display:none;">{{ $record->customer_id }}</td> <!-- Hidden cell -->
            <td>{{ $record->customer_name }}</td>
            <td>{{ $record->product_name }}</td>
            <td>{{ $record->qty }}</td>
            <td>{{ $record->total_price }}</td>
            <td>{{ $record->total_cost }}</td>
            <td>{{ $record->profit }}</td>
            <td>{{ $record->created_at }}</td>

            <!-- Hidden column for Tax Operations -->
            <td id="tax-operations-{{ $record->id }}" style="display:none;">
                @php
                    $taxOperations = '';
                    // Fetch the correct totalPoints for this specific record
                    $totalPoints = $customerTotalPoints->firstWhere('customer_id', $record->customer_id)->total_profit ?? 0;

                    foreach ($taxRates as $tax) {
                        $taxAmount = ($totalPoints * $tax->rate) / 100;  // Correct tax calculation
                        $taxOperations .= "<div class='row'>
                                            <div class='col-6'><strong>" . $tax->name . " (" . $tax->rate . "%):</strong></div>
                                            <div class='col-6'>" . number_format($taxAmount, 2) . "</div>
                                        </div>";
                    }
                @endphp
                {!! $taxOperations !!}
            </td>

            <td>
                @php
                    $totalPoints = $customerTotalPoints->firstWhere('customer_id', $record->customer_id)->total_profit ?? 0;
                @endphp
                {{ number_format($totalPoints, 2) }} <!-- Display Total Points -->
            </td>

            <td>
                <button type="button" class="btn btn-info" onclick="downloadTaxOperations('{{ $record->id }}')">
                    {{ trans('file.Download') }}
                </button>
            </td>
        </tr>
    @endforeach
</tbody>

</table>


    </div>
</div>






            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<script type="text/javascript">
    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #reward-point-setting-menu").addClass("active");

    $('[data-toggle="tooltip"]').tooltip();

    
     // added codes
 
 function downloadTaxOperations(saleId) {
    // Find the corresponding sale record
    var saleRecord = @json($salesCustomerData).find(record => record.id == saleId);
    if (!saleRecord) return;

    // Find the account details (since there's no relation, assume first active account is the store account)
    var accountRecord = @json($activeAccounts).shift();  // Get the first active account

    // Get the tax operation data from the corresponding cell
    var taxData = document.getElementById('tax-operations-' + saleId).innerText;

    // Create a new jsPDF instance
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // Set font size and title spacing
    const titleFontSize = 18;
    const subtitleFontSize = 14;
    const lineSpacing = 8; // line spacing

    // Add the titles and headings with centered alignment
    doc.setFontSize(titleFontSize);
    const titleWidth = doc.getTextWidth('UHAI INNOVATIONS');
    const titleX = (doc.internal.pageSize.width - titleWidth) / 2;
    
    // Adjust the Y-coordinate for the title to reduce space from the top
    const titleY = 25;  // Reduced Y-coordinate to bring it closer to the top

    doc.text('UHAI INNOVATIONS', titleX, titleY);

    // Adjust the Y-coordinate for the subtitle to bring it closer to the title
    const slipY = titleY + titleFontSize + 5; // Reduced vertical spacing between title and subtitle

    doc.setFontSize(subtitleFontSize);
    const slipText = 'UHAI SLIP (LOYALTY SAVINGS & INVESTMENTS)';
    const slipWidth = doc.getTextWidth(slipText);
    const slipX = (doc.internal.pageSize.width - slipWidth) / 2;
    
    // Set light blue color for the row
    doc.setFillColor(173, 216, 230); // Light blue color
    doc.rect(slipX - 5, slipY - subtitleFontSize / 2, slipWidth + 10, subtitleFontSize + 4, 'F'); // Background color for the text row
    
    // Add the concatenated text
    doc.setFillColor(0, 0, 0); // Reset fill color to black for the text
    doc.text(slipText, slipX, slipY);

    // Get the current date and time
    const currentDate = new Date();
    const formattedDate = currentDate.toLocaleString(); // Format as locale-specific string (e.g., "3/28/2025, 10:30:00 AM")

    // Add the date and time stamp below the subtitle
    const dateY = slipY + subtitleFontSize + 5; // Place the date below the subtitle
    doc.text('Generated on: ' + formattedDate, 10, dateY);

    // Add the content to the PDF
    doc.setFontSize(12);
    doc.text('LOYALTYEE NAME: ' + saleRecord.customer_name, 10, dateY + 10 + lineSpacing);
    doc.text('Member No: ' + saleRecord.MemberNo, 10, dateY + 20 + lineSpacing);
    doc.text('LOYALTYEE TEL NO: ' + saleRecord.phone_number, 10, dateY + 30 + lineSpacing);
    
    // Add account details
    if (accountRecord) {
        doc.text('SAH/VILLAGE UHAI CO-OP CODE: ' + accountRecord.account_no, 10, dateY + 40 + lineSpacing);
        doc.text('SAH/VILLAGE UHAI CO-OP NAME: ' + accountRecord.name, 10, dateY + 50 + lineSpacing);
    }

    doc.text(taxData, 10, dateY + 60 + lineSpacing);

    // Save the PDF
    doc.save('Tax_Operations_Sale_' + saleId + '.pdf');
}






</script>
@endpush
