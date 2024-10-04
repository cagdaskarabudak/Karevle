<div class="row">
    <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="card shopping-cart-total-card mb-3">
            <div class="card-body">
            </div>
            <div class="card-footer">
                <div class="total-price">
                    <span class="text">Toplam: </span>
                    <span class="value"> TL</span>
                </div>
                <a href="Javascript:void(0);" type="button" class="shopping-cart-submit-btn btn btn-success text-light">Ödemeye Geç</a>
                <a href="{{ route('shopping-cart.view') }}" type="button" class="cancel-btn">Sepete Dön</a>
            </div>
        </div>
    </div>
    <div class="col-md-12 col-sm-12 @if(count($baskets) == 0) col-lg-12 @else col-lg-9 @endif">
        <div class="card addresses-card shopping-cart-products-card">
            @if(Auth::check())
            <div class="card-header">
                <a href="{{ route('user.address.create') }}" class="btn btn-success text-light">Yeni Adres Oluştur</a>
            </div>
            <div class="card-body address-list">
                <h5>Teslimat Adresi Seçin</h5>
                @foreach(Auth::user()->addresses as $address)
                <div class="d-flex w-100">
                    <input type="radio" class="form-check-input" name="delivery_address" id="address{{$address->id}}" value="{{ $address->id }}" @if($address->is_default == 1) checked @endif>
                    <label class="form-check-label address" for="address{{$address->id}}">
                            <div class="header">
                                <div class="title">
                                    {{ $address->title }} {{ $address->type == 'personal' ? '' : ($address->type == 'personal_company' ? '(Şahıs Şirketi)' : ($address->type == 'company' ? '(Firma)' : '')) }}
                                </div>
                                <div class="city">
                                    {{ $address->city }}
                                </div>
                            </div>
                            <div class="body">
                                {{ $address->address }}
                            </div>
                    </label>
                </div>
                @endforeach

                <h5>Fatura Adresi Seçin</h5>

                @foreach(Auth::user()->addresses as $address)
                <div class="d-flex w-100">
                    <input type="radio" class="form-check-input" name="invoice_address" id="invoice_address{{$address->id}}" value="{{ $address->id }}" @if($address->is_invoice_default == 1) checked @endif>
                    <label class="form-check-label address" for="invoice_address{{$address->id}}">
                            <div class="header">
                                <div class="title">
                                    {{ $address->title }} {{ $address->type == 'personal' ? '' : ($address->type == 'personal_company' ? '(Şahıs Şirketi)' : ($address->type == 'company' ? '(Firma)' : '')) }}
                                </div>
                                <div class="city">
                                    {{ $address->city }}
                                </div>
                            </div>
                            <div class="body">
                                {{ $address->address }}
                            </div>
                    </label>
                </div>
                @endforeach
        </div>
        <script type="module">
             let shoppingcartConfirmButton = document.querySelector('.shopping-cart-submit-btn');
            if(shoppingcartConfirmButton){
                shoppingcartConfirmButton.addEventListener('click', async function(){

                    let delivery_address_id = document.querySelector('input[name="delivery_address"]:checked').value;
                    let invoice_address_id = document.querySelector('input[name="invoice_address"]:checked').value;

                    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
                    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

                    try {
                        const deliveryAddressResponse = await axios.post('/add-shoppingcart-delivery-address', {
                            delivery_address_id:delivery_address_id
                        });
                        const invoiceAddressResponse = await axios.post('/add-shoppingcart-invoice-address', {
                            invoice_address_id:invoice_address_id
                        });

                        if(invoiceAddressResponse.data.status === true && deliveryAddressResponse.data.status === true){
                            window.location.href = "{{ route('shopping-cart.payment.view') }}";
                        }
                    } catch (error) {
                        throw error;
                    }

                });
            }
        </script>
        @else
        <div class="card-body">
            <form id="delivery_address_form">
            <h5>Teslimat Adresi Oluşturun</h5>
                <div class="d-flex justify-content-center">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input address-type" type="radio" name="address_type" id="personal" value="personal" @if(isset($address)) @if($address->type == 'personal') checked @endif @else checked  @endif>
                        <label class="form-check-label" for="personal">
                          Şahıs
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input address-type" type="radio" name="address_type" id="personal_company" value="personal_company" @if(isset($address) && $address->type == 'personal_company') checked @endif>
                        <label class="form-check-label" for="personal_company">
                          Şahıs Şirketi
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input address-type" type="radio" name="address_type" id="company" value="company" @if(isset($address) && $address->type == 'company') checked @endif>
                        <label class="form-check-label" for="company">
                          Firma
                        </label>
                    </div>
                </div>
                <label for="first_name" class="form-label">İsim & Soyisim</label>
                <div class="mb-3 input-group">
                    <input type="text" class="form-control" name="first_name" id="first_name" placeholder="İsim" value="{{ isset($address) ? $address->first_name : '' }}">
                    <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Soyisim" value="{{ isset($address) ? $address->last_name : '' }}">
                </div>
                <div class="mb-3 company-requirements" style="display: none;">
                    <label class="form-label" for="company_name">Şirket Adı</label>
                    <input type="text" class="form-control" name="company_name" id="company_name" value="{{ isset($address) ? $address->company_name : '' }}" placeholder="">
                </div>
                <div class="mb-3 company-requirements" style="display: none;">
                    <label class="form-label" for="tax_office">Vergi Dairesi</label>
                    <input type="text" class="form-control" name="tax_office" id="tax_office" value="{{ isset($address) ? $address->tax_office : '' }}" placeholder="">
                </div>
                <div class="mb-3 company-requirements" style="display: none;">
                    <label class="form-label" for="tax_number">Vergi Numarası</label>
                    <input type="text" class="form-control" name="tax_number" id="tax_number" value="{{ isset($address) ? $address->tax_number : '' }}" placeholder="">
                </div>
                <div class="mb-3 company-requirements" style="display: none;">
                    <label class="form-label" for="mersis_number">MERSIS Numarası</label>
                    <input type="text" class="form-control" name="mersis_number" id="mersis_number" value="{{ isset($address) ? $address->mersis_number : '' }}" placeholder="">
                </div>
                <div class="mb-3 personal-company-requirements" style="display: none;">
                    <label class="form-label" for="ID_number">T.C. Kimlik Numarası</label>
                    <input type="text" class="form-control" name="ID_number" id="ID_number" value="{{ isset($address) ? $address->ID_number : '' }}" placeholder="">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="email">E-Posta</label>
                    <input type="email" class="form-control" name="email" id="email" value="{{ isset($address) ? $address->email : '' }}" placeholder="">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="phone">Telefon</label>
                    <input type="number" class="form-control" name="phone" id="phone" value="{{ isset($address) ? $address->phone : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="country">Ülke</label>
                    <input type="text" class="form-control" name="country" id="country" value="{{ isset($address) ? $address->country : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="city">Şehir</label>
                    <input type="text" class="form-control" name="city" id="city" value="{{ isset($address) ? $address->city : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="district">İlçe</label>
                    <input type="text" class="form-control" name="district" id="district" value="{{ isset($address) ? $address->district : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="address">Açık Adres</label>
                    <textarea class="form-control" name="address" id="address">{{ isset($address) ? $address->address : '' }}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="postal_code">Posta Kodu</label>
                    <input type="number" class="form-control" name="postal_code" id="postal_code" value="{{ isset($address) ? $address->postal_code : '' }}">
                </div>
            </form>
                <hr />
                <form id="invoice_address_form">
                <h5>Fatura Adresi Oluşturun</h5>
                <div class="d-flex justify-content-center">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input invoice-address-type" type="radio" name="address_type" id="invoice_personal" value="personal" @if(isset($iaddress)) @if($iaddress->type == 'personal') checked @endif @else checked @endif>
                        <label class="form-check-label" for="invoice_personal">
                          Şahıs
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input invoice-address-type" type="radio" name="address_type" id="invoice_personal_company" value="personal_company" @if(isset($iaddress) && $iaddress->type == 'personal_company') checked @endif>
                        <label class="form-check-label" for="invoice_personal_company">
                          Şahıs Şirketi
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input invoice-address-type" type="radio" name="address_type" id="invoice_company" value="company" @if(isset($iaddress) && $iaddress->type == 'company') checked @endif>
                        <label class="form-check-label" for="invoice_company">
                          Firma
                        </label>
                    </div>
                </div>
                <label for="first_name" class="form-label">İsim & Soyisim</label>
                <div class="mb-3 input-group">
                    <input type="text" class="form-control" name="first_name" id="first_name" placeholder="İsim" value="{{ isset($iaddress) ? $iaddress->first_name : '' }}">
                    <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Soyisim" value="{{ isset($iaddress) ? $iaddress->last_name : '' }}">
                </div>
                <div class="mb-3 invoice-company-requirements" style="display: none;">
                    <label class="form-label" for="company_name">Şirket Adı</label>
                    <input type="text" class="form-control" name="company_name" id="company_name" value="{{ isset($iaddress) ? $iaddress->company_name : '' }}" placeholder="">
                </div>
                <div class="mb-3 invoice-company-requirements" style="display: none;">
                    <label class="form-label" for="tax_office">Vergi Dairesi</label>
                    <input type="text" class="form-control" name="tax_office" id="tax_office" value="{{ isset($iaddress) ? $iaddress->tax_office : '' }}" placeholder="">
                </div>
                <div class="mb-3 invoice-company-requirements" style="display: none;">
                    <label class="form-label" for="tax_number">Vergi Numarası</label>
                    <input type="text" class="form-control" name="tax_number" id="tax_number" value="{{ isset($iaddress) ? $iaddress->tax_number : '' }}" placeholder="">
                </div>
                <div class="mb-3 invoice-company-requirements" style="display: none;">
                    <label class="form-label" for="mersis_number">MERSIS Numarası</label>
                    <input type="text" class="form-control" name="mersis_number" id="mersis_number" value="{{ isset($iaddress) ? $iaddress->mersis_number : '' }}" placeholder="">
                </div>
                <div class="mb-3 invoice-personal-company-requirements" style="display: none;">
                    <label class="form-label" for="ID_number">T.C. Kimlik Numarası</label>
                    <input type="text" class="form-control" name="ID_number" id="ID_number" value="{{ isset($iaddress) ? $iaddress->ID_number : '' }}" placeholder="">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="email">E-Posta</label>
                    <input type="email" class="form-control" name="email" id="email" value="{{ isset($iaddress) ? $iaddress->email : '' }}" placeholder="">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="phone">Telefon</label>
                    <input type="number" class="form-control" name="phone" id="phone" value="{{ isset($iaddress) ? $iaddress->phone : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="country">Ülke</label>
                    <input type="text" class="form-control" name="country" id="country" value="{{ isset($iaddress) ? $iaddress->country : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="city">Şehir</label>
                    <input type="text" class="form-control" name="city" id="city" value="{{ isset($iaddress) ? $iaddress->city : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="district">İlçe</label>
                    <input type="text" class="form-control" name="district" id="district" value="{{ isset($iaddress) ? $iaddress->district : '' }}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="address">Açık Adres</label>
                    <textarea class="form-control" name="address" id="address">{{ isset($iaddress) ? $iaddress->address : '' }}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="postal_code">Posta Kodu</label>
                    <input type="number" class="form-control" name="postal_code" id="postal_code" value="{{ isset($iaddress) ? $iaddress->postal_code : '' }}">
                </div>
                </form>
            @if($errors->any())
                @foreach($errors->all() as $error)
                {{ $error }}
                @endforeach
            @endif
            @if(session('error'))
                {{ session('error') }}
            @endif
            <script type="module">
    
            function toggleInputs(address_typevalue){
                let company_requirements = document.querySelectorAll('.company-requirements');
                let personal_company_requirements = document.querySelectorAll('.personal-company-requirements');

                if(address_typevalue == 'personal'){
                    company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                    personal_company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                }
                else if(address_typevalue == 'personal_company'){
                    let company_requirements = document.querySelectorAll('.company-requirements');
                    company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                    personal_company_requirements.forEach(company_requirement => {
                        $(company_requirement).show();
                    });
                }
                else if(address_typevalue == 'company'){
                    let company_requirements = document.querySelectorAll('.company-requirements');
                    company_requirements.forEach(company_requirement => {
                        $(company_requirement).show();
                    });
                    personal_company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                }
            }

            function toggleInvoiceInputs(address_typevalue){
                let invoice_company_requirements = document.querySelectorAll('.invoice-company-requirements');
                let invoice_personal_company_requirements = document.querySelectorAll('.invoice-personal-company-requirements');

                if(address_typevalue == 'personal'){
                    invoice_company_requirements.forEach(invoice_company_requirement => {
                        $(invoice_company_requirement).hide();
                    });
                    invoice_personal_company_requirements.forEach(invoice_personal_company_requirement => {
                        $(invoice_personal_company_requirement).hide();
                    });
                }
                else if(address_typevalue == 'personal_company'){
                    invoice_company_requirements.forEach(invoice_company_requirement => {
                        $(invoice_company_requirement).hide();
                    });
                    invoice_personal_company_requirements.forEach(invoice_personal_company_requirement => {
                        $(invoice_personal_company_requirement).show();
                    });
                }
                else if(address_typevalue == 'company'){
                    invoice_company_requirements.forEach(invoice_company_requirement => {
                        $(invoice_company_requirement).show();
                    });
                    invoice_personal_company_requirements.forEach(invoice_personal_company_requirement => {
                        $(invoice_personal_company_requirement).hide();
                    });
                }
            }

            let address_types = document.querySelectorAll('.address-type');
            address_types.forEach(address_type => {
                address_type.addEventListener('change', function(){
                    toggleInputs(address_type.value);
                });
            });

            let invoice_address_types = document.querySelectorAll('.invoice-address-type');
            invoice_address_types.forEach(invoice_address_type => {
                invoice_address_type.addEventListener('change', function(){
                    toggleInvoiceInputs(invoice_address_type.value);
                });
            });

            let checked_address_type = document.querySelector('.address-type[checked]');
            let checked_iaddress_type = document.querySelector('.invoice-address-type[checked]');
            toggleInvoiceInputs(checked_iaddress_type.value);
            toggleInputs(checked_address_type.value);

            let shoppingcartConfirmButton = document.querySelector('.shopping-cart-submit-btn');
            if(shoppingcartConfirmButton){
                shoppingcartConfirmButton.addEventListener('click', async function(){

                    let deliveryAddressForm = new FormData(document.querySelector('#delivery_address_form'));
                    let invoiceAddressForm = new FormData(document.querySelector('#invoice_address_form'));

                    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
                        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

                        try {
                            const deliveryAddressResponse = await axios.post('/add-shoppingcart-delivery-address', deliveryAddressForm, {
                                headers: {
                                    'Content-Type': 'multipart/form-data',
                                }
                            });
                            const invoiceAddressResponse = await axios.post('/add-shoppingcart-invoice-address', invoiceAddressForm, {
                                headers: {
                                    'Content-Type': 'multipart/form-data',
                                }
                            });
                            if(invoiceAddressResponse.data.status === true && deliveryAddressResponse.data.status === true){
                                window.location.href = "{{ route('shopping-cart.payment.view') }}";
                            }
                        } catch (error) {
                            throw error;
                        }

                });
            }
            </script>
        </div>
        
        @endif
    </div>
</div>

<script type="module">
shoppingCardTotalUpdate();

</script>