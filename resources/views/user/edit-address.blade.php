<x-page title="Adreslerim">
    <x-account>
        <form action="{{ route('user.addresses.edit.post') }}" method="POST">
            @csrf
            <input type="hidden" class="form-control" name="id" value="{{ $address->id }}" readonly>
            <div class="mb-3">
                <label class="form-label" for="title">Adres Başlığı</label>
                <input type="text" class="form-control" name="title" id="title" value="{{ $address->title }}" placeholder="Örn.: Ev, İş">
            </div>
            <label for="first_name" class="form-label">İsim & Soyisim</label>
            <div class="mb-3 input-group">
                <input type="text" class="form-control" name="first_name" id="first_name" placeholder="İsim" value="{{ $address->first_name }}">
                <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Soyisim" value="{{ $address->last_name }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="phone">Telefon</label>
                <input type="number" class="form-control" name="phone" id="phone" value="{{ $address->phone }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="country">Ülke</label>
                <input type="text" class="form-control" name="country" id="country" value="{{ $address->country }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="city">Şehir</label>
                <input type="text" class="form-control" name="city" id="city" value="{{ $address->city }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="district">İlçe</label>
                <input type="text" class="form-control" name="district" id="district" value="{{ $address->district }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="address">Açık Adres</label>
                <textarea class="form-control" name="address" id="address">{{ $address->address }}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="postal_code">Posta Kodu</label>
                <input type="number" class="form-control" name="postal_code" id="postal_code" value="{{ $address->postal_code }}">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="is_default" name="is_default" @if($address->is_default == 1) checked @endif>
                <label for="is_default" class="form-check-label">Varsayılan Adresim Olsun</label>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-success text-light">Güncelle</button>
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