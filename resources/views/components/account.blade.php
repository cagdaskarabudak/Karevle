<div class="row justify-content-center">
    <div class="col-lg-3 mb-3">
        <div class="card nav-card">
            <div class="card-body">
                <a href="{{ route('user.profile') }}" class="nav-item @if(Route::currentRouteName() == 'user.profile') active @endif">Hesap Ayarlarım</a>
                <a href="{{ route('user.orders') }}" class="nav-item @if(Route::currentRouteName() == 'user.orders') active @endif">Siparişlerim</a>
                <a href="{{ route('user.addresses') }}" class="nav-item @if(Route::currentRouteName() == 'user.addresses') active @endif">Adreslerim</a>
                <a href="{{ route('user.coupons') }}" class="nav-item @if(Route::currentRouteName() == 'user.coupons') active @endif">Kuponlarım</a>
            </div>
        </div>
    </div>
    <div class="col-lg-9">
        <div class="card">
            <div class="card-body">
                {{ $slot }}
            </div>
        </div>
    </div>
</div>