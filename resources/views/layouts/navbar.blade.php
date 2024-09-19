<div class="mobile-navbar">
  <a href="{{ route('home') }}" class="brand">
      <x-application-logo />
  </a>
  <div class="search-div search-sm">
    <form action="{{ route('search') }}" method="GET">
      <input type="text" class="search" name="terimler" placeholder="Aradığınız ürün veya kategoriyi yazınız">
      <button type="submit" class="btn-submit"><i class="fa-solid fa-search"></i></button>
    </form>
    <div class="search-results">
      <div class="list products">
        <div class="title">Ürünler</div>
        <div class="items"></div>
      </div>
      <div class="list categories">
        <div class="title">Kategoriler</div>
        <div class="items"></div>
      </div>
    </div>
</div>
</div>
<div class="nav-div">
    <div class="navbar">
        <div class="navbar-top">
            <a href="{{ route('home') }}" class="brand">
                <x-application-logo />
            </a>
            <div class="search-div search-lg">
                <form action="{{ route('search') }}" method="GET">
                  <input type="text" class="search" name="terimler" placeholder="Aradığınız ürün veya kategoriyi yazınız">
                  <button type="submit" class="btn-submit"><i class="fa-solid fa-search"></i></button>
                </form>
                <div class="search-results">
                  <div class="list products">
                    <div class="title">Ürünler</div>
                    <div class="items"></div>
                  </div>
                  <div class="list categories">
                    <div class="title">Kategoriler</div>
                    <div class="items"></div>
                  </div>
                </div>
            </div>
            <div class="user-menu">
              @if(Auth::check())
                <div class="dropdown">
                  <a class="menu-item @if(Route::currentRouteName() == 'user.profile' || Route::currentRouteName() == 'user.orders' || Route::currentRouteName() == 'user.addresses' || Route::currentRouteName() == 'user.coupons') active @endif" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Hesabım</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="{{ route('user.profile') }}" class="dropdown-item text-center d-flex justify-content-center align-items-center text-primary @if(Route::currentRouteName() == 'user.profile') active text-light @endif">@if(Auth::user()->avatar != null) <img src="/storage/{{ Auth::user()->avatar }}" class="user-avatar-image"> @else <div class="user-text-avatar">{{ mb_substr(Auth::user()->first_name, 0, 1).mb_substr(Auth::user()->last_name, 0, 1) }}</div> @endif {{ Auth::user()->first_name.' '.Auth::user()->last_name }}</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'user.orders') active text-light @endif" href="{{ route('user.orders') }}">Siparişlerim</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'user.addresses') active text-light @endif" href="{{ route('user.addresses') }}">Adreslerim</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'user.coupons') active text-light @endif" href="{{ route('user.coupons') }}">Kuponlarım</a></li>
                    <li><a class="dropdown-item" href="{{ route('logout') }}">Çıkış Yap</a></li>
                  </ul>
                </div>
              @else
                <div class="dropdown">
                  <a class="menu-item @if(Route::currentRouteName() == 'login.view' || Route::currentRouteName() == 'register.view') active @endif" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Giriş Yap</span></a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'login.view') active @endif" href="{{ route('login.view') }}">Giriş Yap</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'register.view') active @endif" href="{{ route('register.view') }}">Üye Ol</a></li>
                  </ul>
                </div>
              @endif
                <a href="{{ route('favorites') }}" class="menu-item menu-item-danger @if(Route::currentRouteName() == 'favorites') active active-danger @endif"><i class="fa-regular fa-heart"></i> <span>Favorilerim</span></a>
                <a href="#" class="menu-item @if(Route::currentRouteName() == 'myShoppingCart') active @endif"><i class="fa-regular fa-cart-shopping"></i> <span>Sepetim</span></a>
            </div>
        </div>
        <div class="navbar-bottom">
            <a href="{{ route('home') }}" class="brand">
                KAREVLE
            </a>
            <div class="menu">
                <a class="menu-item menu-item-info @if(Route::currentRouteName() == 'category.view' || Route::currentRouteName() == 'allProducts.view') active active-info @endif" data-bs-toggle="offcanvas" href="#allCategoriesOffCanvas" role="button" aria-controls="allCategoriesOffCanvas"><i class="fa-regular fa-bars"></i> <span>Tüm Kategoriler</span></a>
                @if(Auth::check())
                
                <div class="menu-item dropdown user-item dropup-center dropup">
                  <a class="menu-item @if(Route::currentRouteName() == 'user.profile' || Route::currentRouteName() == 'user.orders' || Route::currentRouteName() == 'user.addresses' || Route::currentRouteName() == 'user.coupons') active @endif" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Hesabım</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="{{ route('user.profile') }}" class="dropdown-item text-center d-flex justify-content-center align-items-center text-primary @if(Route::currentRouteName() == 'user.profile') active text-light @endif">@if(Auth::user()->avatar != null) <img src="/storage/{{ Auth::user()->avatar }}" class="user-avatar-image"> @else <div class="user-text-avatar">{{ mb_substr(Auth::user()->first_name, 0, 1).mb_substr(Auth::user()->last_name, 0, 1) }}</div> @endif {{ Auth::user()->first_name.' '.Auth::user()->last_name }}</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'user.orders') active text-light @endif" href="{{ route('user.orders') }}">Siparişlerim</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'user.addresses') active text-light @endif" href="{{ route('user.addresses') }}">Adreslerim</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'user.coupons') active text-light @endif" href="{{ route('user.coupons') }}">Kuponlarım</a></li>
                    <li><a class="dropdown-item" href="{{ route('logout') }}">Çıkış Yap</a></li>
                  </ul>
                </div>
              @else
                <div class="menu-item dropdown user-item dropup-center dropup">
                  <a class="menu-item @if(Route::currentRouteName() == 'login.view' || Route::currentRouteName() == 'register.view') active @endif" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Giriş Yap</span></a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'login.view') active @endif" href="{{ route('login.view') }}">Giriş Yap</a></li>
                    <li><a class="dropdown-item @if(Route::currentRouteName() == 'register.view') active @endif" href="{{ route('register.view') }}">Üye Ol</a></li>
                  </ul>
                </div>
              @endif
                <a href="{{ route('home') }}" class="menu-item @if(Route::currentRouteName() == 'home') active @endif"><i class="fa-regular fa-home"></i> <span>Ana Sayfa</span></a>
                <a href="{{ route('favorites') }}" class="menu-item menu-item-danger user-item @if(Route::currentRouteName() == 'favorites') active active-danger @endif"><i class="fa-regular fa-heart"></i> <span>Favorilerim</span></a>
                <a href="#" class="menu-item user-item @if(Route::currentRouteName() == 'myShoppingCart') active @endif"><i class="fa-regular fa-cart-shopping"></i> <span>Sepetim</span></a>
                @foreach($lists as $liste)
                    <a href="{{ route('list.view', $liste->slug) }}" class="menu-item menu-item-{{ $liste->color }} list-item @if(request()->path() == "liste/{$liste->slug}") active active-{{ $liste->color }} @endif"><i class="fa-regular {{ $liste->icon }}"></i> <span>{{ $liste->name }}</span></a>
                @endforeach
            </div>
        </div>
    </div>
</div>

<div class="offcanvas offcanvas-start" tabindex="-1" id="allCategoriesOffCanvas" aria-labelledby="allCategoriesOffCanvasLabel">
    <div class="offcanvas-header">
        <a href="#" class="offcanvas-title" id="allCategoriesOffCanvasLabel">
          <x-application-logo />
        </a>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <ul class="offcanvas-menu">
        <li class="menu-item @if(request()->path() == "tum-urunler") active @endif">
          <a href="{{ route('allProducts.view') }}">Tüm Ürünler</a>
        </li>
        @foreach($categories as $category)
          <li class="menu-item @if(request()->path() == "kategoriler/{$category->slug}") active open @endif @foreach($category->child_categories as $sub_category) @if(request()->path() == "kategoriler/{$sub_category->slug}") active open @else @foreach($sub_category->child_categories as $child_category)  @if(request()->path() == "kategoriler/{$child_category->slug}") active open @endif @endforeach @endif @endforeach">
            <a href=@if(!count($category->child_categories) > 0)"{{ route('category.view', $category->slug) }}"@else"Javascript:void(0);"@endif>{{ $category->name }} @if(count($category->child_categories) > 0)  <i class="fa-solid @php $thisopenstatus = false; @endphp @if(request()->path() == "kategoriler/{$category->slug}") fa-chevron-down @php $thisopenstatus = true; @endphp @else @foreach($category->child_categories as $sub_category) @if(request()->path() == "kategoriler/{$sub_category->slug}") fa-chevron-down @php $thisopenstatus = true; @endphp @else @foreach($sub_category->child_categories as $child_category)  @if(request()->path() == "kategoriler/{$child_category->slug}") fa-chevron-down @php $thisopenstatus = true; @endphp @endif @endforeach @endif @endforeach @endif @if($thisopenstatus == false) fa-chevron-right @endif"></i> @endif</a>
            @if(count($category->child_categories) > 0)
            <ul class="menu-sub">
              <li class="menu-item @if(request()->path() == "kategoriler/{$category->slug}") active @endif">
                <a href="{{ route('category.view', $category->slug) }}">{{ $category->name }} Kategorisindeki Her Şey</a>
              </li>
              @foreach($category->child_categories as $subCategory)
                <li class="menu-item @if(request()->path() == "kategoriler/{$subCategory->slug}") active open @endif @foreach($subCategory->child_categories as $sub_category) @if(request()->path() == "kategoriler/{$sub_category->slug}") active open @else @foreach($sub_category->child_categories as $child_category)  @if(request()->path() == "kategoriler/{$child_category->slug}") active open @endif @endforeach @endif @endforeach">
                  <a href=@if(!count($subCategory->child_categories) > 0)"{{ route('category.view', $subCategory->slug) }}"@else"Javascript:void(0);"@endif>{{ $subCategory->name }} @if(count($subCategory->child_categories) > 0)  <i class="fa-solid @php $thisopenstatus = false; @endphp @if(request()->path() == "kategoriler/{$category->slug}") fa-chevron-down @php $thisopenstatus = true; @endphp @else @foreach($category->child_categories as $sub_category) @if(request()->path() == "kategoriler/{$sub_category->slug}") fa-chevron-down @php $thisopenstatus = true; @endphp @else @foreach($sub_category->child_categories as $child_category)  @if(request()->path() == "kategoriler/{$child_category->slug}") fa-chevron-down @php $thisopenstatus = true; @endphp @endif @endforeach @endif @endforeach @endif @if($thisopenstatus == false) fa-chevron-right @endif"></i> @endif</a>
                  @if(count($subCategory->child_categories) > 0)
                  <ul class="menu-sub">
                    <li class="menu-item @if(request()->path() == "kategoriler/{$subCategory->slug}") active @endif">
                      <a href="{{ route('category.view', $subCategory->slug) }}">{{ $subCategory->name }} Kategorisindeki Her Şey</a>
                    </li>
                    @foreach($subCategory->child_categories as $child_category)
                      <li class="menu-item @if(request()->path() == "kategoriler/{$child_category->slug}") active @endif @foreach($child_category->child_categories as $sub_category) @if(request()->path() == "kategoriler/{$sub_category->slug}") active open @else @foreach($sub_category->child_categories as $child_category)  @if(request()->path() == "kategoriler/{$child_category->slug}") active open @endif @endforeach @endif @endforeach">
                        <a href="{{ route('category.view', $child_category->slug) }}">{{ $child_category->name }}</a>
                      </li>
                    @endforeach
                  </ul>
                  @endif
                </li>
              @endforeach
            </ul>
            @endif
          </li>
        @endforeach
      </ul>
    </div>
  </div>