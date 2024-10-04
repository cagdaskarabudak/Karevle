<x-page title="Adreslerim">
    <x-account>
        <form action="{{ route('user.address.create') }}" method="POST">
            @csrf
            <div class="d-flex justify-content-center">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="address_type" id="personal" value="personal" checked>
                    <label class="form-check-label" for="personal">
                      Şahıs
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="address_type" id="personal_company" value="personal_company">
                    <label class="form-check-label" for="personal_company">
                      Şahıs Şirketi
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="address_type" id="company" value="company">
                    <label class="form-check-label" for="company">
                      Firma
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label" for="title">Adres Başlığı</label>
                <input type="text" class="form-control" name="title" id="title" value="{{ old('title') }}" placeholder="Örn.: Ev, İş">
            </div>
            <label for="first_name" class="form-label">İsim & Soyisim</label>
            <div class="mb-3 input-group">
                <input type="text" class="form-control" name="first_name" id="first_name" placeholder="İsim" value="{{ old('first_name') }}">
                <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Soyisim" value="{{ old('last_name') }}">
            </div>
            <div class="mb-3 company-requirements" style="display: none;">
                <label class="form-label" for="company_name">Şirket Adı</label>
                <input type="text" class="form-control" name="company_name" id="company_name" value="{{ old('company_name') }}" placeholder="">
            </div>
            <div class="mb-3 company-requirements" style="display: none;">
                <label class="form-label" for="tax_office">Vergi Dairesi</label>
                <input type="text" class="form-control" name="tax_office" id="tax_office" value="{{ old('tax_office') }}" placeholder="">
            </div>
            <div class="mb-3 company-requirements" style="display: none;">
                <label class="form-label" for="tax_number">Vergi Numarası</label>
                <input type="text" class="form-control" name="tax_number" id="tax_number" value="{{ old('tax_number') }}" placeholder="">
            </div>
            <div class="mb-3 company-requirements" style="display: none;">
                <label class="form-label" for="mersis_number">MERSIS Numarası</label>
                <input type="text" class="form-control" name="mersis_number" id="mersis_number" value="{{ old('mersis_number') }}" placeholder="">
            </div>
            <div class="mb-3 personal-company-requirements" style="display: none;">
                <label class="form-label" for="ID_number">T.C. Kimlik Numarası</label>
                <input type="text" class="form-control" name="ID_number" id="ID_number" value="{{ old('ID_number') }}" placeholder="">
            </div>
            <div class="mb-3">
                <label class="form-label" for="email">E-Posta</label>
                <input type="email" class="form-control" name="email" id="email" value="{{ old('email') }}" placeholder="">
            </div>
            <div class="mb-3">
                <label class="form-label" for="phone">Telefon</label>
                <input type="number" class="form-control" name="phone" id="phone" value="{{ old('phone') }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="country">Ülke</label>
                <input type="text" class="form-control" name="country" id="country" value="{{ old('country') }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="city">Şehir</label>
                <input type="text" class="form-control" name="city" id="city" value="{{ old('city') }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="district">İlçe</label>
                <input type="text" class="form-control" name="district" id="district" value="{{ old('district') }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="address">Açık Adres</label>
                <textarea class="form-control" name="address" id="address">{{ old('address') }}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="postal_code">Posta Kodu</label>
                <input type="number" class="form-control" name="postal_code" id="postal_code" value="{{ old('postal_code') }}">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="is_default" name="is_default">
                <label for="is_default" class="form-check-label">Varsayılan Adresim Olsun</label>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="is_invoice_default" name="is_invoice_default">
                <label for="is_invoice_default" class="form-check-label">Varsayılan Fatura Adresim Olsun</label>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-success text-light">Kaydet</button>
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

            let company_requirements = document.querySelectorAll('.company-requirements');

            let personal_company_requirements = document.querySelectorAll('.personal-company-requirements');

            let address_types = document.querySelectorAll('[name="address_type"]');
            address_types.forEach(address_type => {
                address_type.addEventListener('change', function(){
                if(address_type.value == 'personal'){
                    company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                    personal_company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                }
                else if(address_type.value == 'personal_company'){
                    let company_requirements = document.querySelectorAll('.company-requirements');
                    company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                    personal_company_requirements.forEach(company_requirement => {
                        $(company_requirement).show();
                    });
                }
                else if(address_type.value == 'company'){
                    let company_requirements = document.querySelectorAll('.company-requirements');
                    company_requirements.forEach(company_requirement => {
                        $(company_requirement).show();
                    });
                    personal_company_requirements.forEach(company_requirement => {
                        $(company_requirement).hide();
                    });
                }
            });
            });
        </script>
    </x-account>
</x-page>