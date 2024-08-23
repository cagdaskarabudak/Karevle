<div class="row header-row">
    <div class="col-lg-2 brand-div">
        <a class="brand-link" href="{{ route('dashboard.home') }}"><x-application-logo /> <span class="app-brand-text demo">Karevle</span></a>
    </div>
    <div class="col-lg-10">
        <div class="row h-100 d-flex align-items-center">
            <div class="col-lg-12 top-navbar-div">
                <ul class="top-navbar">
                    <li class="nav-item @if(Route::currentRouteName() == 'dashboard.home') active @endif"><a href="{{ route('dashboard.home') }}" class="nav-link"><i class="fa-thin fa-house fa-sm"></i> Gösterge Paneli</a></li>
                    <li class="nav-item"><a class="nav-link" href="{{ route('home') }}" target="_blank"><i class="fa-thin fa-eye fa-sm"></i> Siteyi Görüntüle</a></li>                    
                    <li class="nav-item dropdown ms-auto">
                        <a type="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" class="nav-link"><i class="fa-thin fa-money-bill fa-sm"></i> Satış</a>
                        <ul class="dropdown-menu">
                            <li><a href="{{ route('dashboard.products') }}" class="dropdown-item fw-bold">Ürünler</a></li>
                            <li><a href="{{ route('dashboard.products.create.view') }}" class="dropdown-item">Ürün Oluştur</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Kategoriler</a></li>
                            <li><a href="#" class="dropdown-item">Kategori Oluştur</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Siparişler</a></li>
                            <li><a href="#" class="dropdown-item">Yeni Siparişler</a></li>
                            <li><a href="#" class="dropdown-item">İşlemdeki Siparişler</a></li>
                            <li><a href="#" class="dropdown-item">Tamamlanmış Siparişler</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">İadeler</a></li>
                            <li><a href="#" class="dropdown-item">Yeni Talepler</a></li>
                            <li><a href="#" class="dropdown-item">İşleme Alınmış Talepler</a></li>
                            <li><a href="#" class="dropdown-item">Tamamlanmış İadeler</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Sorular</a></li>
                            <li><a href="#" class="dropdown-item">Cevaplanmamış Sorular</a></li>
                            <li><a href="#" class="dropdown-item">Cevaplanmış Sorular</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a type="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" class="nav-link"><i class="fa-thin fa-sparkles fa-sm"></i> Pazarlama</a>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="dropdown-item fw-bold">Kampanyalar</a></li>
                            <li><a href="#" class="dropdown-item">Kampanya Oluştur</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Listeler</a></li>
                            <li><a href="#" class="dropdown-item">Liste Oluştur</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Sliderlar</a></li>
                            <li><a href="#" class="dropdown-item">Slider Oluştur</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown me-auto">
                        <a type="button" data-bs-toggle="dropdown" aria-expanded="false" href="#" class="nav-link"><i class="fa-thin fa-people-roof fa-sm"></i> İdare</a>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="dropdown-item fw-bold">Kullanıcılar</a></li>
                            <li><a href="#" class="dropdown-item">Kullanıcı Oluştur</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Site Ayarları</a></li>
                            <li><a href="#" class="dropdown-item">Ana Sayfa Ayarları</a></li>
                            <li><a href="#" class="dropdown-item">Ürün Sayfası Ayarları</a></li>
                            <li><a href="#" class="dropdown-item">Kategori & Liste Sayfası Ayarları</a></li>
                            <li><a href="#" class="dropdown-item">Satış & Sipariş Ayarları</a></li>
                            <hr class="dropdown-divider">
                            <li><a href="#" class="dropdown-item fw-bold">Ödeme Sistemi Ayarları</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown mx-auto">
                        <a type="button" data-bs-toggle="dropdown" aria-expanded="false" class="nav-link" href="#"><div class="user-avatar">@if(Auth::user()->avatar == null) {{ mb_substr(Auth::user()->first_name, 0, 1) }}{{ mb_substr(Auth::user()->last_name, 0, 1) }} @else <img src="{{ '/storage/'.Auth::user()->avatar }}" alt="user-pp"> @endif</div> {{ Auth::user()->first_name.' '.Auth::user()->last_name }}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('user.profile') }}">Profili Düzenle</a></li>
                            <li><a class="dropdown-item" href="{{ route('logout') }}">Çıkış</a></li>
                          </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script type="module">
    let navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(navItem => {
        if(navItem.classList.contains('active')){
            navItem.querySelector('i').classList.remove('fa-thin');
            navItem.querySelector('i').classList.add('fa-solid');
        }
    });
</script>