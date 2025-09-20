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

    <div class="row mb-3">
    <div class="col-md-12">
        <input type="text" id="searchMemberNo" class="form-control" placeholder="Search by Member Number" />
    </div>
</div>

    <div class="card-body">
        <!-- Fetch the active tax rates from the taxes table -->
    @php
    // Get the current admin's pos_accnt_id
    $admin_pos_accnt_id = Auth::user()->pos_accnt_id;

    $taxRates = DB::table('taxes')
        ->where('is_active', 1) // Only fetch records where is_active is 1
        ->where('pos_accnt_id', $admin_pos_accnt_id) // Filter by admin's pos_accnt_id
        ->select('rate', 'name', 'TAX_SHORT_DESC')
        ->get();


    // Fetch active accounts from the accounts table
    $activeAccounts = DB::table('accounts')
        ->where('is_active', 1)
        ->where('pos_accnt_id', $admin_pos_accnt_id) // Filter by admin's pos_accnt_id
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
            'customers.INPL',
            'customers.LoyaltyPoints', // Fetch LoyaltyPoints
            'product_sales.qty',
            'product_sales.created_at',
            'products.name as product_name',
            DB::raw('products.price * product_sales.qty as total_price'),
            DB::raw('products.cost * product_sales.qty as total_cost'),
            DB::raw('(products.price * product_sales.qty) - (products.cost * product_sales.qty) as profit')
        )
        ->where('sales.pos_accnt_id', $admin_pos_accnt_id) // Filter sales by admin's pos_accnt_id
        ->where('customers.pos_accnt_id', $admin_pos_accnt_id) // Filter customers by admin's pos_accnt_id
        ->where('products.pos_accnt_id', $admin_pos_accnt_id) // Filter products by admin's pos_accnt_id
        ->whereIn('sales.id', function($query) use ($admin_pos_accnt_id) {
            $query->select(DB::raw('max(id)'))
                  ->from('sales')
                  ->where('pos_accnt_id', $admin_pos_accnt_id) // Filter by admin's pos_accnt_id
                  ->groupBy('customer_id');
        })
        ->orderBy('product_sales.created_at', 'desc')
        ->get();



    // Calculate the total profit for each customer
    $customerTotalPoints = DB::table('sales')
        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
        ->join('products', 'product_sales.product_id', '=', 'products.id')
        ->select(
            'sales.customer_id',
            DB::raw('SUM((products.price * product_sales.qty) - (products.cost * product_sales.qty)) as total_profit')
        )
        ->where('sales.pos_accnt_id', $admin_pos_accnt_id) // Filter sales by admin's pos_accnt_id
        ->where('products.pos_accnt_id', $admin_pos_accnt_id) // Filter products by admin's pos_accnt_id
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
            ->where('pos_accnt_id', $admin_pos_accnt_id) // Only update customers with matching pos_accnt_id
            ->update(['LoyaltyPoints' => $totalPoints]); // Update LoyaltyPoints with the total points value
    }
    @endphp


        <!-- Display the customer, sales, product_name, total_cost, total_price, profit, and tax operations data in a table -->
       <table class="table table-bordered">
    <thead>
    <tr>
        <th class="d-none">{{ trans('file.Sale ID') }}</th>
        <th class="d-none">{{ trans('file.Customer ID') }}</th>
        <th>Customer Name</th>
        <th>Member Number</th>
        <th class="d-none">{{ trans('file.INPL') }}</th> <!-- Hide INPL -->
        <th class="d-none">{{ trans('file.Loyalty Points') }}</th> <!-- Hide Loyalty Points -->
        <th>INPL Total</th>
        <th class="d-none">{{ trans('file.Product Name') }}</th>
        <th class="d-none">{{ trans('file.Quantity') }}</th>
        <th class="d-none">{{ trans('file.Total Price') }}</th>
        <th class="d-none">{{ trans('file.Total Cost') }}</th>
        <th class="d-none">{{ trans('file.Profit') }}=</th>
        <th class="d-none">{{ trans('file.Created At') }}</th>
        <th class="d-none">{{ trans('file.Tax Operations') }}</th>
        <th>Total Points</th>
        <th>{{ trans('file.Download') }}</th>
    </tr>
</thead>
<tbody>
    @foreach($salesCustomerData as $record)
        <tr>
            <td class="d-none">{{ $record->id }}</td>
            <td class="d-none">{{ $record->customer_id }}</td>
            <td>{{ $record->customer_name }}</td>
            <td>{{ $record->MemberNo }}</td>
            <td class="d-none">{{ $record->INPL }}</td> 
            <td class="d-none">{{ number_format($record->LoyaltyPoints, 2) }}</td> 
        <td>
    @php
        $inplTotal = $record->INPL + $record->LoyaltyPoints;
    @endphp
    @if($inplTotal < 0)
        {{ number_format($inplTotal, 2) }}
    @else
        <span class="text-muted">No INPL</span>
    @endif
</td>

            <td class="d-none">{{ $record->product_name }}</td>
            <td class="d-none">{{ $record->qty }}</td>
            <td class="d-none">{{ $record->total_price }}</td>
            <td class="d-none">{{ $record->total_cost }}</td>
            <td class="d-none">{{ $record->profit }}</td>
            <td class="d-none">{{ $record->created_at }}</td>
           

 <td class="d-none" id="tax-operations-{{ $record->id }}">
    @php
        $taxOperations = '';
        $totalPoints = $customerTotalPoints->firstWhere('customer_id', $record->customer_id)->total_profit ?? 0;

        // Create a mapping of TAX_SHORT_DESC to the corresponding name
        $taxDescToName = [];
        foreach ($taxRates as $tax) {
            $taxDescToName[$tax->TAX_SHORT_DESC] = $tax->name;  // Mapping TAX_SHORT_DESC to name
        }

        // Handle "BASIC LOYALTY SAVINGS" to always be at the top
        $basicLoyaltyTax = '';
        foreach ($taxRates as $tax) {
            if ($tax->TAX_SHORT_DESC == 'BLS') {
                $taxAmount = $totalPoints;
                $taxDisplay = number_format($taxAmount, 2);
                $basicLoyaltyTax = "<div class='row'>
                                        <div class='col-12'><strong>" . $taxDescToName[$tax->TAX_SHORT_DESC] . " (" . $tax->rate . "%): " . $taxDisplay . "</strong></div>
                                     </div>";
                break; // Once we've found the BASIC LOYALTY SAVINGS, no need to keep looking for it
            }
        }

        // Add "BASIC LOYALTY SAVINGS" tax first
        $taxOperations .= $basicLoyaltyTax;

        // Now loop through the rest of the tax rates
        foreach ($taxRates as $tax) {
            if ($tax->TAX_SHORT_DESC != 'BLS') {
                if ($tax->TAX_SHORT_DESC == 'INPL') {
                    $inplTotal = $record->INPL + $record->LoyaltyPoints;
                    if ($inplTotal < 0) {
                        $taxDisplay = number_format($inplTotal, 2);
                    } else {
                        $taxDisplay = 'No INPL';
                    }
                } else {
                    // Set tax amounts to zero if INPL total is negative
                    if ($inplTotal < 0) {
                        $taxAmount = 0;
                        $taxDisplay = '0.00';
                    } else {
                        $taxAmount = ($totalPoints * $tax->rate) / 100;
                        $taxDisplay = number_format($taxAmount, 2);
                    }
                }

                // Output the tax name and value in the "Tax name: Tax value" format
                $taxOperations .= "<div class='row'>
                                        <div class='col-12'><strong>" . $taxDescToName[$tax->TAX_SHORT_DESC] . " (" . $tax->rate . "%): " . $taxDisplay . "</strong></div>
                                     </div>";
            }
        }
    @endphp
    {!! $taxOperations !!}
</td>




          <td class="total-points">
    @php
        $totalPoints = $customerTotalPoints->firstWhere('customer_id', $record->customer_id)->total_profit ?? 0;
    @endphp
    {{ number_format($totalPoints, 2) }}
</td>

            <td>
                <button type="button" class="btn btn-info" onclick="downloadTaxOperations('{{ $record->id }}')">
                    {{ trans('file.Download') }}
                </button>
            </td>
        </tr>
    @endforeach
</tbody>
<tfoot>
    <tr>
        <td colspan="3" class="text-right"><strong>Total Points:</strong></td>
        <td id="total-sum" colspan="6"><strong>0.00</strong></td>
    </tr>
</tfoot>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/5.0.2/jspdf.plugin.autotable.min.js" integrity="sha512-JizZOUNesiGhMcp9fsA/9W31FOat6QysBM8hSj6ir8iIANIUJ2mhko7Lo1+j0ErftmJ8SebMZLm9iielKjeIEQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #reward-point-setting-menu").addClass("active");

    $('[data-toggle="tooltip"]').tooltip();

    
     // pdf codes

function downloadTaxOperations(saleId) {
    var saleRecord = @json($salesCustomerData).find(record => record.id == saleId);
    if (!saleRecord) return;

    var accountRecord = @json($activeAccounts).shift();
    var taxData = document.getElementById('tax-operations-' + saleId).innerText;

    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    const pageWidth = doc.internal.pageSize.getWidth();
    let currentY = 25;

    doc.setFontSize(16);
    const title = 'UHAI INNOVATIONS';
    const titleX = (pageWidth - doc.getTextWidth(title)) / 2;
    doc.text(title, titleX, currentY);

    currentY += 10;

    doc.setFontSize(12);
    const subtitle1 = 'UHAI SLIP';
    const subtitle2 = '(LOYALTY SAVINGS & INVESTMENTS)';
    const maxWidth = Math.max(doc.getTextWidth(subtitle1), doc.getTextWidth(subtitle2));
    const subtitleX = (pageWidth - maxWidth) / 2;

    doc.setFillColor(173, 216, 230);
    doc.rect(subtitleX - 4, currentY - 8, maxWidth + 8, 18, 'F');

    doc.text(subtitle1, subtitleX, currentY);
    currentY += 6;
    doc.text(subtitle2, subtitleX, currentY);
    currentY += 14;

    const formattedDate = new Date().toLocaleString();
    doc.setFontSize(11);
    doc.text('Date:', 20, currentY);
    doc.text(formattedDate, 130, currentY);
    currentY += 10;

    if (accountRecord) {
        doc.text('CO-OP CODE:', 20, currentY);
        doc.text(accountRecord.account_no || '', 130, currentY);
        currentY += 8;

        doc.text('CO-OP NAME:', 20, currentY);
        doc.text(accountRecord.name || '', 130, currentY);
        currentY += 10;
    }

    doc.line(20, currentY, pageWidth - 20, currentY);
    currentY += 8;

    doc.text('LOYALTYEE NAME:', 20, currentY);
    doc.text(saleRecord.customer_name || '', 130, currentY);
    currentY += 8;

    doc.text('MEMBER NUMBER:', 20, currentY);
    doc.text(saleRecord.MemberNo || '', 130, currentY);
    currentY += 8;

    const phoneNumber = saleRecord.phone_number ? '0' + saleRecord.phone_number : '';
    doc.text('LOYALTYEE TEL NO:', 20, currentY);
    doc.text(phoneNumber, 130, currentY);
    currentY += 12;

    doc.line(20, currentY, pageWidth - 20, currentY);
    currentY += 10;

    doc.text('TAX OPERATIONS', 20, currentY);
    currentY += 5;

    const taxLines = taxData.trim().split('\n');
    const taxRows = [];
    taxData.split('\n').forEach(line => {
        if (line.trim()) {
            const parts = line.split(':');
            const title = parts[0].trim();
            const value = parts.slice(1).join(':').trim();
            taxRows.push([title, value]);
        }
    });

    doc.autoTable({
    startY: currentY + 5,
    head: [['Description (%)', 'Amount ']],
    body: taxRows,
    theme: 'grid',
    styles: {
        fontSize: 10,
        cellPadding: { top: 3, bottom: 3, left: 3, right: 3 },
        lineHeight: 1.4
    },
    headStyles: {
        fillColor: [41, 128, 185],
        textColor: 255,
    },
    columnStyles: {
        0: { cellWidth: 120 },
        1: { halign: 'right' },
    }
});


    const finalY = doc.lastAutoTable.finalY + 10;

    doc.line(20, finalY, pageWidth - 20, finalY);

    doc.text('RECEIVED BY NAME:', 20, finalY + 10);
    doc.text('______________________________', 130, finalY + 10);

    doc.text('SIGNATURE:', 20, finalY + 20);
    doc.text('______________________________', 130, finalY + 20);

    doc.save('Loyalty_' + saleRecord.customer_name + '.pdf');
}


// Filter the table rows by Member Number
    $('#searchMemberNo').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $("table tbody tr").filter(function() {
            var memberNo = $(this).find('td:eq(3)').text().toLowerCase();  // Member Number is in the 4th column (index 3)
            $(this).toggle(memberNo.indexOf(value) > -1);  // Show rows where Member Number matches the input value
        });
    });

     document.addEventListener("DOMContentLoaded", function() {
        let total = 0;
        document.querySelectorAll("td.total-points").forEach(function(cell) {
            let value = parseFloat(cell.textContent.replace(/,/g, '')) || 0;
            total += value;
        });
        document.getElementById("total-sum").innerHTML = "<strong>" + total.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "</strong>";
    });
</script>
@endpush