<x-page title="Adreslerim">
    <x-account>
        <form action="{{ route('user.address.create') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="title">Adres Başlığı</label>
                <input type="text" class="form-control" name="title" id="title" value="{{ old('title') }}" placeholder="Örn.: Ev, İş">
            </div>
            <label for="first_name" class="form-label">İsim & Soyisim</label>
            <div class="mb-3 input-group">
                <input type="text" class="form-control" name="first_name" id="first_name" placeholder="İsim" value="{{ old('first_name') }}">
                <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Soyisim" value="{{ old('last_name') }}">
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
    </x-account>
</x-page>