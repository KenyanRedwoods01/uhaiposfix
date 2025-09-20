@extends('backend.layout.main')

@section('content')
@if(session()->has('create_message'))
    <div class="alert alert-success alert-dismissible text-center">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        {!! session()->get('create_message') !!}
    </div>
@endif
@if(session()->has('edit_message'))
    <div class="alert alert-success alert-dismissible text-center">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        {{ session()->get('edit_message') }}
    </div>
@endif
@if(session()->has('import_message'))
    <div class="alert alert-success alert-dismissible text-center">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        {!! session()->get('import_message') !!}
    </div>
@endif
@if(session()->has('not_permitted'))
    <div class="alert alert-danger alert-dismissible text-center">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        {{ session()->get('not_permitted') }}
    </div>
@endif

<section>
    <div class="container-fluid">
        @if(in_array("customers-add", $all_permission))
            <a href="{{ route('customer.create') }}" class="btn btn-info"><i class="dripicons-plus"></i> Add Customer</a>&nbsp;
            <a href="#" data-toggle="modal" data-target="#importCustomer" class="btn btn-primary"><i class="dripicons-copy"></i> Import Customer</a>
        @endif
    </div>
    
    <div class="table-responsive">
        <table id="customer-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{ trans('file.Customer Group') }}</th>
                    <th>{{ trans('file.Customer Details') }}</th>
                    <th>{{ trans('file.Reward Points') }}</th>
                    <th>ID Number</th> <!-- Add Location Column -->
                    <th>Country</th> <!-- New Column -->
                    <th>Sub County</th> <!-- New Column -->
                    <th>Ward</th> <!-- New Column -->
                    <th>Sub Location</th> <!-- New Column -->
                    <th>Village</th> <!-- New Column -->
                    <th>Next of kin</th> <!-- New Column -->
                    <th>Member Number</th> <!-- New Column -->
                    <th>Next of Kin Mobile</th> <!-- New Column -->
                    <th>Next of Kin Relationship</th> <!-- New Column -->
                    <th>Status</th> <!-- New Column -->

                    @foreach($custom_fields as $fieldName)
                        <th>{{ $fieldName }}</th>
                    @endforeach
                    <th class="not-exported">Action</th>

                </tr>
            </thead>
        </table>
    </div>
</section>

<div id="importCustomer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            {!! Form::open(['route' => 'customer.import', 'method' => 'post', 'files' => true]) !!}
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{ trans('file.Import Customer') }}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
                <p class="italic"><small>{{ trans('file.The field labels marked with * are required input fields') }}.</small></p>
                <p>The correct column order is Customer Group, Name, University, Email, Phone Number, Phone Number 2, Campus, Year of Study, Programme, Nationality, Student ID, National ID, Country, Sub County, Ward, Sublocation, Village, Member Number, Next of Kin - Name, Next of Kin - Mobile, Next of Kin - Relationship, INPL</p>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>{{ trans('file.Upload CSV File') }} *</label>
                            {{ Form::file('file', array('class' => 'form-control', 'required')) }}
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>{{ trans('file.Sample File') }}</label>
                            <a href="sample_file/dummyCustomers.csv" class="btn btn-info btn-block btn-md"><i class="dripicons-download"></i> {{ trans('file.Download') }}</a>
                        </div>
                    </div>
                </div>
                <input type="submit" value="{{ trans('file.submit') }}" class="btn btn-primary" id="submit-button">
            </div>
            {!! Form::close() !!}
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script type="text/javascript">
    $("ul#people").siblings('a').attr('aria-expanded', 'true');
    $("ul#people").addClass("show");
    $("ul#people #customer-list-menu").addClass("active");

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    var customer_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;
    var all_permission = <?php echo json_encode($all_permission) ?>;

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var columns = [
        {"data": "key"}, 
        {"data": "customer_group"}, 
        {"data": "customer_details"}, 
        {"data": "reward_point"}, 
        {"data": "location"}, 
        { "data": "origin" }, 
        { "data": "sub_county" }, 
        { "data": "ward" }, 
        { "data": "sublocation" },  
        {"data": "village"}, 
        {"data": "next_of_kin"}, 
        {"data": "MemberNo"}, 
        {"data": "next_of_kin_mobile"}, 
        {"data": "next_of_kin_relationship"},
            {"data": "status"}, // Added new status column


];

    var field_name = <?php echo json_encode($field_name) ?>;
    for(i = 0; i < field_name.length; i++) {
        columns.push({"data": field_name[i]});
    }

    columns.push({"data": "options"});

    $('#customer-table').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: "customers/customer-data",
            data: {
                all_permission: all_permission,
            },
            dataType: "json",
            type: "post"
        },
        "columns": columns,
        "language": {
            "lengthMenu": '_MENU_ {{ trans("file.records per page") }}',
            "info": '<small>{{ trans("file.Showing") }} _START_ - _END_ (_TOTAL_)</small>',
            "search": 'Member No / Name',
            "paginate": {
                "previous": '<i class="dripicons-chevron-left"></i>',
                "next": '<i class="dripicons-chevron-right"></i>'
            }
        },
        "order": [['1', 'desc']],
        "columnDefs": [
            {
                "targets": [4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 
                "visible": false
            },
            {
                "orderable": false,
                "targets": [0, 2, 3, 4, 5, 6, 7]
            }
        ],
        'select': { style: 'multi', selector: 'td:first-child' },
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        rowId: 'ObjectID',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                },
                customize: function(doc) {
                    // Adjusting the document properties to fit the content in the PDF
                    doc.styles = {
                        table: {
                            widths: 'auto', // This allows automatic width adjustment
                        },
                        body: {
                            fontSize: 7, // Reduce font size to fit content
                            columnGap: 2, // Add spacing between columns if needed
                            cellPadding: 2, // Adjust cell padding for compactness
                            overflow: 'linebreak', // Ensure text in cells wraps instead of overflowing
                        },
                        header: {
                            fontSize: 9, // Larger font size for headers
                            bold: true,
                        },
                        footer: {
                            fontSize: 7,
                        },
                    };

                    // Rotate long columns or add custom styles
                    doc.content[1].table.body.forEach(function(row) {
                        row.forEach(function(cell, index) {
                            // Check if the column index is one with long text
                            if (index > 2) { // Assuming columns with long text are after index 2
                                cell.styles = {
                                    alignment: 'center',
                                    angle: 45, // Rotate text for long content
                                    fontSize: 7, // Adjust font size if necessary
                                };
                            }
                        });
                    });

                    // Adjust page size to fit all content
                    doc.pageSize = 'A4';  // Adjust to your needs
                    doc.pageMargins = [10, 10, 10, 10]; // Set the page margins
                }
            },
            {
                extend: 'excel',
                text: '<i title="export to excel" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
        
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ]
    });

    //ststauts active/inactive
$(document).on('click', '.toggle-status', function() {
    var customerId = $(this).data('id');
    var currentStatus = $(this).data('status');

    // Display confirmation prompt
    var action = (currentStatus == 1) ? 'deactivate' : 'activate';
    var confirmationMessage = 'Are you sure you want to ' + action + ' this customer?';

    // If user confirms, proceed with status change
    if (confirm(confirmationMessage)) {
        var newStatus = (currentStatus == 1) ? 2 : 1;
        var statusText = (newStatus == 1) ? 'Active' : 'Inactive';
        var statusClass = (newStatus == 1) ? 'btn-success' : 'btn-danger';
        
        // Update the button's text and class
        $(this).text(statusText).removeClass('btn-success btn-danger').addClass(statusClass);
        $(this).data('status', newStatus);

        // Send AJAX request to update status in the database
        $.ajax({
            url: "{{ url('customers/update-status') }}",  // Route for AJAX request
            type: 'POST',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                id: customerId,
                status: newStatus
            },
            success: function(response) {
                // Handle success response
                if (response.success) {
                    console.log('Status updated successfully');
                } else {
                    console.log('Error: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                console.log('AJAX Error: ' + status + ' - ' + error);
            }
        });
    } else {
        // If user cancels, do nothing
        console.log('Status change cancelled');
    }
});


</script>
@endpush
