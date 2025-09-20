@extends('backend.layout.main') 
@section('content')

@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
    {{ session()->get('not_permitted') }}
  </div>
@endif

<!-- Display validation errors -->
@if ($errors->any())
    <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4>{{trans('file.Add Customer')}}</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => 'customer.store', 'method' => 'post', 'files' => true]) !!}
                        
                        <input type="hidden" name="pos_accnt_id" value="{{ Auth::user()->pos_accnt_id }}">

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>{{ trans('file.Customer Group') }} *</label>
                                    <select required class="form-control selectpicker" id="customer-group-id" name="customer_group_id">
                                        @foreach($lims_customer_group_all as $key => $customer_group)
                                            <option value="{{ $customer_group->id }}" {{ $key == 1 ? 'selected' : '' }}>
                                                {{ $customer_group->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>{{trans('file.name')}} *</label>
                                    <input type="text" id="name" name="customer_name" required class="form-control" value="{{ old('customer_name') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>University <span class="asterisk">*</span></label>
                                    <input type="text" name="company_name" class="form-control" value="{{ old('company_name') }}">
                                    @if($errors->has('company_name'))
                                        <span class="text-danger">
                                            <strong>{{ $errors->first('company_name') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>{{trans('file.Email')}} <span class="asterisk">*</span></label>
                                    <input type="email" name="email" placeholder="example@example.com" 
                                           class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" 
                                           value="{{ old('email') }}">
                                    @if($errors->has('email'))
                                        <span class="text-danger">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>{{ trans('file.Phone Number') }} *</label>
                                    <input type="text" name="phone_number" id="phone_number" 
                                           placeholder="254712345678" required 
                                           class="form-control {{ $errors->has('phone_number') ? 'is-invalid' : '' }}" 
                                           pattern="\d{10}" title="Phone number must be exactly 10 digits"
                                           maxlength="14" oninput="validatePhoneNumber(this)"
                                           value="{{ old('phone_number') }}">
                                    <span id="phone_number_error" style="color: red; display: none;">10 digits</span>
                                    @if($errors->has('phone_number'))
                                        <span class="text-danger">
                                            <strong>{{ $errors->first('phone_number') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Phone Number 2</label>
                                    <input type="text" id="phoneNumber" name="tax_no" 
                                           placeholder="0712345678" class="form-control" 
                                           maxlength="10" value="{{ old('tax_no') }}">
                                    <small class="text-danger" id="error-message" style="display: none;">10 digits</small>
                                </div>
                            </div>

                            <!-- Rest of your form fields with old() values -->
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Campus</label>
                                    <input type="text" name="address" class="form-control" value="{{ old('address') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Year of Study</label>
                                    <input type="text" name="city" placeholder="2025" class="form-control" required value="{{ old('city') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Programme</label>
                                    <input type="text" name="state" class="form-control" required value="{{ old('state') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Nationality</label>
                                    <input type="text" name="postal_code" class="form-control" required value="{{ old('postal_code') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Student ID</label>
                                    <input type="text" name="country" class="form-control" required value="{{ old('country') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>National ID</label>
                                    <input type="text" name="location" placeholder="12345678" class="form-control" required value="{{ old('location') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Country</label>
                                    <input type="text" name="origin" class="form-control" required value="{{ old('origin') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Sub County</label>
                                    <input type="text" name="sub_county" class="form-control" required value="{{ old('sub_county') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Ward</label>
                                    <input type="text" name="ward" class="form-control" required value="{{ old('ward') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Sublocation</label>
                                    <input type="text" name="sublocation" class="form-control" required value="{{ old('sublocation') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Village</label>
                                    <input type="text" name="village" class="form-control" required value="{{ old('village') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Next of Kin - Name</label>
                                    <input type="text" name="next_of_kin" class="form-control" placeholder="Name" required value="{{ old('next_of_kin') }}">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Next of Kin - Mobile</label>
                                    <input type="text" id="nextOfKinMobile" name="next_of_kin_mobile" 
                                           class="form-control" placeholder="0712345678" 
                                           maxlength="10" value="{{ old('next_of_kin_mobile') }}">
                                    <small class="text-danger" id="error-message-kin" style="display: none;">10 digits</small>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Next of Kin - Relationship</label>
                                    <select name="next_of_kin_relationship" class="form-control" required>
                                        <option value="">Select Relationship</option>
                                        <option value="Mother" {{ old('next_of_kin_relationship') == 'Mother' ? 'selected' : '' }}>Mother</option>
                                        <option value="Father" {{ old('next_of_kin_relationship') == 'Father' ? 'selected' : '' }}>Father</option>
                                        <option value="Son" {{ old('next_of_kin_relationship') == 'Son' ? 'selected' : '' }}>Son</option>
                                        <option value="Daughter" {{ old('next_of_kin_relationship') == 'Daughter' ? 'selected' : '' }}>Daughter</option>
                                        <option value="Wife" {{ old('next_of_kin_relationship') == 'Wife' ? 'selected' : '' }}>Wife</option>
                                        <option value="Sister" {{ old('next_of_kin_relationship') == 'Sister' ? 'selected' : '' }}>Sister</option>
                                        <option value="Brother" {{ old('next_of_kin_relationship') == 'Brother' ? 'selected' : '' }}>Brother</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-md-4"> 
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="inplCheckbox" onchange="setINPLValue()" {{ old('INPL') == '-500' ? 'checked' : '' }}> INPL
                                    </label>
                                    <input type="hidden" id="inplValue" name="INPL" value="{{ old('INPL', '0') }}">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <input type="hidden" name="pos" value="0">
                            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Rest of your modals and content -->

@endsection

@push('scripts')
<script type="text/javascript">
    $("ul#people").siblings('a').attr('aria-expanded','true');
    $("ul#people").addClass("show");
    $("ul#people #customer-create-menu").addClass("active");

    $('.asterisk').hide();
    $(".user-input").hide();

    $('input[name="both"]').on('change', function() {
        if ($(this).is(':checked')) {
            $('.asterisk').show();
            $('input[name="company_name"]').prop('required',true);
            $('input[name="email"]').prop('required',true);
        }
        else{
            $('.asterisk').hide();
            $('input[name="company_name"]').prop('required',false);
            $('input[name="email"]').prop('required',false);
        }
    });

    $('input[name="user"]').on('change', function() {
        if ($(this).is(':checked')) {
            $('.user-input').show(300);
            $('input[name="name"]').prop('required',true);
            $('input[name="password"]').prop('required',true);
        }
        else{
            $('.user-input').hide(300);
            $('input[name="name"]').prop('required',false);
            $('input[name="password"]').prop('required',false);
        }
    });

    function generateMemberNumber() {
        document.getElementById("MemberNo").value = Math.floor(10000 + Math.random() * 90000);
    }

    function validatePhoneNumber(input) {
        let phoneNumber = input.value;
        let errorSpan = document.getElementById('phone_number_error');

        if (!/^\d{10}$/.test(phoneNumber)) {
            errorSpan.style.display = 'inline';
        } else {
            errorSpan.style.display = 'none';
        }
    }

    document.getElementById("phoneNumber").addEventListener("input", function () {
        let input = this.value.replace(/\D/g, '');
        if (input.length > 10) {
            input = input.slice(0, 10);
        }
        this.value = input;
        document.getElementById("error-message").style.display = (input.length === 10) ? "none" : "block";
    });

    document.getElementById("nextOfKinMobile").addEventListener("input", function () {
        let input = this.value.replace(/\D/g, '');
        if (input.length > 10) {
            input = input.slice(0, 10);
        }
        this.value = input;
        document.getElementById("error-message-kin").style.display = (input.length === 10) ? "none" : "block";
    });

    function setINPLValue() {
        const checkbox = document.getElementById('inplCheckbox');
        const hiddenInput = document.getElementById('inplValue');
        hiddenInput.value = checkbox.checked ? -500 : 0;
    }
</script>
@endpush