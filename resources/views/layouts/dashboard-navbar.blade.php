
  <div class="nav-div">
      <div class="navbar">
          <div class="navbar-bottom">
              <a href="{{ route('home') }}" class="brand">
                  KAREVLE
              </a>
              <div class="menu">
                  <a href="{{ route('home') }}" class="menu-item @if(Route::currentRouteName() == 'home') active @endif"><i class="fa-regular fa-home"></i> <span>Ana Sayfa</span></a>
              </div>
          </div>
      </div>
  </div>