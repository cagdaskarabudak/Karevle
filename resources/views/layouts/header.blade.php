<div class="row header-row">
    <ul class="header links">
        @if(Auth::check() && Auth::user()->role->id == 1)
        <li><a href="{{ route('dashboard.home') }}" target="_blank">Dashboard</a></li>
        @endif
        <li><a href="{{ route('about-me') }}"><i class="fa-thin fa-circle-info"></i> Hakkımızda</a></li>
        <li><a href="{{ route('contact') }}"><i class="fa-thin fa-phone"></i> İletişim & Destek</a></li>
        <li><a href="#"><i class="fa-thin fa-scarf"></i> Bizimle Kazan</a></li>
    </ul>
    <div class="col-lg-2 brand-div">
        <a class="brand-link" href="{{ route('home') }}"><x-application-logo /> <span class="app-brand-text demo">Karevle</span></a>
    </div>
    <div class="col-lg-10">
        <div class="row">
            <div class="col-lg-8 search-div">
                <div class="search-icon">
                    <i class="fa-thin fa-magnifying-glass"></i>
                </div>
                <input type="text" class="search-input" placeholder="Ara...">
                <div class="search-results-div">
                    <ul>
                        Ürünler
                        <li><a href="#"><img src="{{ Vite::asset('resources/img/karavle.png') }}" alt="primg">Ürün 1 <span>100 TL</span></a></li>
                        <li><a href="#"><img src="{{ Vite::asset('resources/img/karavle.png') }}" alt="primg">Ürün 1 <span>100 TL</span></a></li>
                        <li><a href="#"><img src="{{ Vite::asset('resources/img/karavle.png') }}" alt="primg">Ürün 1 <span>100 TL</span></a></li>
                        <li><a href="#"><img src="{{ Vite::asset('resources/img/karavle.png') }}" alt="primg">Ürün 1 <span>100 TL</span></a></li>
                        <li><a href="#"><img src="{{ Vite::asset('resources/img/karavle.png') }}" alt="primg">Ürün 1 <span>100 TL</span></a></li>
                    </ul>
                    <ul>
                        Kategoriler
                        <li><a href="#">Kategori 1</a></li>
                        <li><a href="#">Kategori 1</a></li>
                        <li><a href="#">Kategori 1</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 bottom-navbar-div">
                <ul class="bottom-navbar">
                    @if(!Auth::check()) 
                    <li class="nav-item"><a type="button" class="nav-link" data-bs-toggle="modal" data-bs-target="#authModal"><i class="fa-thin fa-user fa-sm"></i> Giriş & Kayıt</a></li> 
                    @else 
                    <li class="nav-item dropdown">
                        <a type="button" data-bs-toggle="dropdown" aria-expanded="false" class="nav-link" href="#"><div class="user-avatar">@if(Auth::user()->avatar == null) {{ mb_substr(Auth::user()->first_name, 0, 1) }}{{ mb_substr(Auth::user()->last_name, 0, 1) }} @else <img src="{{ '/storage/'.Auth::user()->avatar }}" alt="user-pp"> @endif</div> {{ Auth::user()->first_name.' '.Auth::user()->last_name }}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('user.profile') }}">Profili Düzenle</a></li>
                            <li><a class="dropdown-item" href="#">Siparişlerim</a></li>
                            <li><a class="dropdown-item" href="#">Kuponlarım</a></li>
                            <li><a class="dropdown-item" href="#">Değerlendirmelerim</a></li>
                            <li><a class="dropdown-item" href="#">Hesap Ayarları</a></li>
                            <li><a class="dropdown-item" href="{{ route('logout') }}">Çıkış</a></li>
                          </ul>
                    </li>
                    @endif
                    <li class="nav-item @if(Route::currentRouteName() == 'shopping-card.view') active @endif"><a class="nav-link shopping-card-nav-link" data-bs-toggle="offcanvas" href="#shoppingCardOffCanvas" role="button" aria-controls="shoppingCardOffCanvas">
                        <i class="fa-thin fa-cart-shopping fa-sm"></i> 
                        Sepet
                        <span class="badge">
                            
                        </span>
                        </a></li>
                    @if(Auth::check())
                        <li class="nav-item @if(Route::currentRouteName() == 'favorites') active @endif">
                            <a href="{{ route('favorites') }}" class="nav-link favorites-nav-link">
                            <i class="fa-thin fa-heart fa-sm"></i> 
                            Favoriler
                            <span class="badge">
                                
                            </span>
                        </a></li>
                    @endif
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 top-navbar-div">
                <ul class="top-navbar">
                    <li class="nav-item @if(Route::currentRouteName() == 'home') active @endif"><a href="{{ route('home') }}" class="nav-link"><i class="fa-thin fa-house fa-sm"></i> Ana Sayfa</a></li>
                    <li class="nav-item"><a class="nav-link" data-bs-toggle="offcanvas" href="#categoriesOffcanvas" role="button" aria-controls="categoriesOffcanvas"><i class="fa-thin fa-bars fa-sm"></i> Kategoriler</a></li>
                    <li class="nav-item"><a href="{{ route('list.show', 'yeni-urunler') }}" class="nav-link text-success"><i class="fa-thin fa-sparkles fa-sm"></i> Yeni Ürünler</a></li>
                    <li class="nav-item"><a href="{{ route('list.show', 'populer-urunler') }}" class="nav-link text-primary"><i class="fa-thin fa-fire-flame-curved fa-sm"></i> Popüler Ürünler</a></li>
                    <li class="nav-item"><a href="{{ route('list.show', 'indirimli-urunler') }}" class="nav-link text-warning"><i class="fa-thin fa-tag fa-sm"></i> İndirimli Ürünler</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="offcanvas offcanvas-start" tabindex="-1" id="categoriesOffcanvas" aria-labelledby="categoriesOffcanvasLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title" id="categoriesOffcanvasLabel">Kategoriler</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="categories">
            @foreach($categories as $category)
            <li>
                <a href="{{ route('category.view', $category->slug) }}">{{ $category->name }}</a>
                <ul>
                    @foreach($category->getAllSubCategories() as $subCategory)
                    <li><a href="{{ route('category.view', $subCategory->slug) }}">{{ $subCategory->name }}</a></li>
                    @endforeach
                </ul>
            </li>
            @endforeach
        </ul>
    </div>
</div>

  <div class="offcanvas offcanvas-end" tabindex="-1" id="shoppingCardOffCanvas" aria-labelledby="shoppingCardOffCanvasLabel">
    <div class="offcanvas-header border-bottom">
      <h5 class="offcanvas-title" id="shoppingCardOffCanvasLabel">Sepetim (<span></span> Ürün)</h5>
      <div class="total">Toplam: <span></span> TL</div>
      <button type="button" class="button-close" data-bs-dismiss="offcanvas" aria-label="Close"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
    <div class="offcanvas-body">
        <div class="shopping-card">

        </div>
    </div>
    <div class="offcanvas-footer">
        <a class="btn btn-primary text-light go-to-shopping-card-btn" type="button" href="{{ route('shopping-card.view') }}">Sepete Git</a>
        <a class="btn btn-success text-light shopping-card-success-btn" href="">Sepeti Onayla</a>
    </div>
  </div>

@if(!Auth::check())
  <div class="modal fade" id="authModal" tabindex="-1" aria-labelledby="authModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
            <nav class="nav nav-pills justify-content-center w-100">
                <a class="flex-sm-fill text-sm-center nav-link active authSwitch" href="Javascript:void(0);" switchTo="login-inner">Giriş Yap</a>
                <a class="flex-sm-fill text-sm-center nav-link authSwitch" href="Javascript:void(0);" switchTo="register-inner">Kayıt Ol</a>
            </nav>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="auth-inner register-inner" style="display: none;">
                <form action="{{ route('register.post') }}" method="POST" id="register-form">
                    @csrf
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="first_name">İsim</label>
                        <input class="form-control" type="text" name="first_name" id="first_name" value="{{ old('first_name') }}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="last_name">Soy İsim</label>
                        <input class="form-control" type="text" name="last_name" id="last_name" value="{{ old('last_name') }}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="username">Kullanıcı Adı</label>
                        <input class="form-control" type="text" name="username" id="username" value="{{ old('username') }}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="email">E-Posta</label>
                        <input class="form-control" type="mail" name="email" id="email" value="{{ old('email') }}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="phone">Telefon (+90)</label>
                        <input class="form-control" type="text" name="phone" id="phone" value="{{ old('phone') }}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="password">Şifre</label>
                        <input class="form-control" type="password" name="password" id="password" value="{{ old('password') }}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="password_confirmation">Şifre Tekrar</label>
                        <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" value="{{ old('password_confirmation') }}">
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" name="kvkk" id="kvkk">
                        <label class="form-check-label" for="kvkk">KVKK Metnini okudum, onayladım.</label>
                    </div>
                    <div class="mb-3 d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary">Kayıt Ol</button>
                    </div>
                    <div class="social-buttons">
                        <a href="#" class="social-button"><i class="fa-brands fa-google"></i> <span>Google ile Kayıt Ol</span></a>
                        <a href="#" class="social-button"><i class="fa-brands fa-facebook"></i> <span>Facebook ile Kayıt Ol</span></a>
                        <a href="#" class="social-button"><i class="fa-brands fa-apple"></i> <span>Apple ile Kayıt Ol</span></a>
                        <a href="#" class="social-button"><i class="fa-brands fa-linkedin"></i> <span>LinkedIn ile Kayıt Ol</span></a>
                    </div>
                </form>
                @if($errors->any())
                    <span class="text-danger">Errors:</span>
                    <ul>
                        @foreach($errors->all() as $error)
                            <li class="text-danger">{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif
            </div>
            <div class="auth-inner login-inner">
                <form action="{{ route('login.post') }}" method="POST" id="login-form">
                    @csrf
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="username_for_login">Kullanıcı Adı / E-Posta / Telefon (+90)</label>
                        <input class="form-control" type="text" name="username" id="username_for_login">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-secondary" for="password_for_login">Şifre</label>
                        <input class="form-control" type="password" name="password" id="password_for_login">
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" name="remember_me" id="remember_me">
                        <label class="form-check-label" for="remember_me">Beni Hatırla</label>
                    </div>
                    <div class="mb-3 d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary">Giriş Yap</button>
                        <a href="#">Şifremi unuttum</a>
                    </div>
                    <div class="social-buttons">
                        <a href="#" class="social-button"><i class="fa-brands fa-google"></i> <span>Google ile giriş yap</span></a>
                        <a href="#" class="social-button"><i class="fa-brands fa-facebook"></i> <span>Facebook ile giriş yap</span></a>
                        <a href="#" class="social-button"><i class="fa-brands fa-apple"></i> <span>Apple ile giriş yap</span></a>
                        <a href="#" class="social-button"><i class="fa-brands fa-linkedin"></i> <span>LinkedIn ile giriş yap</span></a>
                    </div>
                </form>
                @if($errors->any())
                    <span class="text-danger">Errors:</span>
                    <ul>
                        @foreach($errors->all() as $error)
                            <li class="text-danger">{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
      </div>
    </div>
  </div>
@endif

<script type="module">
    let navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(navItem => {
        if(navItem.classList.contains('active')){
            navItem.querySelector('i').classList.remove('fa-thin');
            navItem.querySelector('i').classList.add('fa-solid');
        }
    });

    let authSwitches = document.querySelectorAll('.authSwitch');
    authSwitches.forEach(authSwitch => {
        authSwitch.addEventListener('click', function(){
            if(!authSwitch.classList.contains('active')) {
                authSwitches.forEach(authSwitch2 => {
                    authSwitch2.classList.remove('active');
                });
                authSwitch.classList.add('active');
                document.querySelectorAll('.auth-inner').forEach(authInner => {
                    authInner.style.display = 'none';
                });
                document.querySelector('.'+authSwitch.getAttribute('switchTo')).style.display = 'block';
            }
        });
    });

    let searchInput = document.querySelector('input.search-input');
    let searchResults = document.querySelector('.search-results-div');
    searchInput.addEventListener('keyup', function(){
        if(searchInput.value.length > 0){
            searchResults.style.display = 'block';
        }
        else{
            searchResults.style.display = 'none';
        }
    });

    document.addEventListener('DOMContentLoaded', function(){
        shoppingCard.refresh();
        favorites.refresh();
    });
</script>