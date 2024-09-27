<x-page title="Adreslerim">
    <x-account>
        <a href="{{ route('user.addresses.create') }}" class="btn btn-success text-light">Yeni Adres Ekle</a>
        <hr />
        <div class="address-list">
            @forelse(Auth::user()->addresses as $address)
                <div class="address @if($address->is_default == 1) default @endif">
                    <div class="header">
                        <div class="title">
                            {{ $address->title }}
                        </div>
                        <div class="city">
                            {{ $address->city }}
                        </div>
                    </div>
                    <div class="body">
                        {{ $address->address }}
                    </div>
                    <div class="footer">
                        <a href="Javascript:void(0);" class="btn btn-danger text-light btn-sm address-delete-btn" data-id="{{ $address->id }}"> <i class="fa-solid fa-trash"></i> Sil</a>
                        <a href="{{ route('user.addresses.edit', $address->id) }}" class="btn btn-info text-light btn-sm" data-id="{{ $address->id }}"> <i class="fa-solid fa-pencil"></i> Düzenle</a>
                        @if(!$address->is_default == 1) <a href="Javascript:void(0);" class="btn btn-warning text-light btn-sm address-default-btn" data-id="{{ $address->id }}"> Varsayılan Yap</a>@endif
                    </div>
                </div>
            @empty
                Adresiniz yok.
            @endforelse
        </div>
    </x-account>
</x-page>