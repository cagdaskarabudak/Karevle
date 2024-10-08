<div class="top-navbar">
  <div class="link-group">
    <a href="#">Satış Yap</a>
    <a href="#">Hakkımızda</a>
    <a href="#">Destek</a>
    <?php if(Auth::check() && Auth::user()->role->name == 'Administrator'): ?>
    <a href="<?php echo e(route('dashboard.home')); ?>">Yönetim Paneli</a>
    <?php endif; ?>
  </div>
</div>
<div class="mobile-navbar">
  <a href="<?php echo e(route('home')); ?>" class="brand">
      <?php if (isset($component)) { $__componentOriginal40b9bc8bbe72b013cda6958fd160ce72 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72 = $attributes; } ?>
<?php $component = App\View\Components\ApplicationLogo::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('application-logo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ApplicationLogo::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72)): ?>
<?php $attributes = $__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72; ?>
<?php unset($__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal40b9bc8bbe72b013cda6958fd160ce72)): ?>
<?php $component = $__componentOriginal40b9bc8bbe72b013cda6958fd160ce72; ?>
<?php unset($__componentOriginal40b9bc8bbe72b013cda6958fd160ce72); ?>
<?php endif; ?>
  </a>
  <div class="search-div search-sm">
    <form action="<?php echo e(route('search')); ?>" method="GET">
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
            <a href="<?php echo e(route('home')); ?>" class="brand">
                <?php if (isset($component)) { $__componentOriginal40b9bc8bbe72b013cda6958fd160ce72 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72 = $attributes; } ?>
<?php $component = App\View\Components\ApplicationLogo::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('application-logo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ApplicationLogo::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72)): ?>
<?php $attributes = $__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72; ?>
<?php unset($__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal40b9bc8bbe72b013cda6958fd160ce72)): ?>
<?php $component = $__componentOriginal40b9bc8bbe72b013cda6958fd160ce72; ?>
<?php unset($__componentOriginal40b9bc8bbe72b013cda6958fd160ce72); ?>
<?php endif; ?>
            </a>
            <div class="search-div search-lg">
                <form action="<?php echo e(route('search')); ?>" method="GET">
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
              <?php if(Auth::check()): ?>
                <div class="dropdown">
                  <a class="menu-item <?php if(Route::currentRouteName() == 'user.profile' || Route::currentRouteName() == 'user.orders' || Route::currentRouteName() == 'user.addresses' || Route::currentRouteName() == 'user.coupons'): ?> active <?php endif; ?>" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Hesabım</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="<?php echo e(route('user.profile')); ?>" class="dropdown-item text-center d-flex justify-content-center align-items-center text-primary <?php if(Route::currentRouteName() == 'user.profile'): ?> active text-light <?php endif; ?>"><?php if(Auth::user()->avatar != null): ?> <img src="/storage/<?php echo e(Auth::user()->avatar); ?>" class="user-avatar-image"> <?php else: ?> <div class="user-text-avatar"><?php echo e(mb_substr(Auth::user()->first_name, 0, 1).mb_substr(Auth::user()->last_name, 0, 1)); ?></div> <?php endif; ?> <?php echo e(Auth::user()->first_name.' '.Auth::user()->last_name); ?></a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'user.orders'): ?> active text-light <?php endif; ?>" href="<?php echo e(route('user.orders')); ?>">Siparişlerim</a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'user.addresses'): ?> active text-light <?php endif; ?>" href="<?php echo e(route('user.addresses')); ?>">Adreslerim</a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'user.coupons'): ?> active text-light <?php endif; ?>" href="<?php echo e(route('user.coupons')); ?>">Kuponlarım</a></li>
                    <li><a class="dropdown-item" href="<?php echo e(route('logout')); ?>">Çıkış Yap</a></li>
                  </ul>
                </div>
              <?php else: ?>
                <div class="dropdown">
                  <a class="menu-item <?php if(Route::currentRouteName() == 'login.view' || Route::currentRouteName() == 'register.view'): ?> active <?php endif; ?>" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Giriş Yap</span></a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'login.view'): ?> active <?php endif; ?>" href="<?php echo e(route('login.view')); ?>">Giriş Yap</a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'register.view'): ?> active <?php endif; ?>" href="<?php echo e(route('register.view')); ?>">Üye Ol</a></li>
                  </ul>
                </div>
              <?php endif; ?>
                <a href="<?php echo e(route('favorites')); ?>" class="menu-item menu-item-danger <?php if(Route::currentRouteName() == 'favorites'): ?> active active-danger <?php endif; ?>"><i class="fa-regular fa-heart"></i> <span>Favorilerim</span></a>
                <a href="<?php echo e(route('shopping-cart.view')); ?>" class="menu-item <?php if(Route::currentRouteName() == 'shopping-cart.view'): ?> active <?php endif; ?> position-relative"><i class="fa-regular fa-cart-shopping"></i> <span>Sepetim</span>
                  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary shopping-cart-count-badge"></span>
              </a>
            </div>
        </div>
        <div class="navbar-bottom">
            <a href="<?php echo e(route('home')); ?>" class="brand">
                KAREVLE
            </a>
            <div class="menu">
                <a class="menu-item menu-item-info <?php if(Route::currentRouteName() == 'category.view' || Route::currentRouteName() == 'allProducts.view'): ?> active active-info <?php endif; ?>" data-bs-toggle="offcanvas" href="#allCategoriesOffCanvas" role="button" aria-controls="allCategoriesOffCanvas"><i class="fa-regular fa-bars"></i> <span>Tüm Kategoriler</span></a>
                <?php if(Auth::check()): ?>
                
                <div class="menu-item dropdown user-item dropup-center dropup">
                  <a class="menu-item <?php if(Route::currentRouteName() == 'user.profile' || Route::currentRouteName() == 'user.orders' || Route::currentRouteName() == 'user.addresses' || Route::currentRouteName() == 'user.coupons'): ?> active <?php endif; ?>" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Hesabım</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="<?php echo e(route('user.profile')); ?>" class="dropdown-item text-center d-flex justify-content-center align-items-center text-primary <?php if(Route::currentRouteName() == 'user.profile'): ?> active text-light <?php endif; ?>"><?php if(Auth::user()->avatar != null): ?> <img src="/storage/<?php echo e(Auth::user()->avatar); ?>" class="user-avatar-image"> <?php else: ?> <div class="user-text-avatar"><?php echo e(mb_substr(Auth::user()->first_name, 0, 1).mb_substr(Auth::user()->last_name, 0, 1)); ?></div> <?php endif; ?> <?php echo e(Auth::user()->first_name.' '.Auth::user()->last_name); ?></a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'user.orders'): ?> active text-light <?php endif; ?>" href="<?php echo e(route('user.orders')); ?>">Siparişlerim</a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'user.addresses'): ?> active text-light <?php endif; ?>" href="<?php echo e(route('user.addresses')); ?>">Adreslerim</a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'user.coupons'): ?> active text-light <?php endif; ?>" href="<?php echo e(route('user.coupons')); ?>">Kuponlarım</a></li>
                    <li><a class="dropdown-item" href="<?php echo e(route('logout')); ?>">Çıkış Yap</a></li>
                  </ul>
                </div>
              <?php else: ?>
                <div class="menu-item dropdown user-item dropup-center dropup">
                  <a class="menu-item <?php if(Route::currentRouteName() == 'login.view' || Route::currentRouteName() == 'register.view'): ?> active <?php endif; ?>" href="Javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-regular fa-user"></i> <span>Giriş Yap</span></a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'login.view'): ?> active <?php endif; ?>" href="<?php echo e(route('login.view')); ?>">Giriş Yap</a></li>
                    <li><a class="dropdown-item <?php if(Route::currentRouteName() == 'register.view'): ?> active <?php endif; ?>" href="<?php echo e(route('register.view')); ?>">Üye Ol</a></li>
                  </ul>
                </div>
              <?php endif; ?>
                <a href="<?php echo e(route('home')); ?>" class="menu-item <?php if(Route::currentRouteName() == 'home'): ?> active <?php endif; ?>"><i class="fa-regular fa-home"></i> <span>Ana Sayfa</span></a>
                <a href="<?php echo e(route('favorites')); ?>" class="menu-item menu-item-danger user-item <?php if(Route::currentRouteName() == 'favorites'): ?> active active-danger <?php endif; ?>"><i class="fa-regular fa-heart"></i> <span>Favorilerim</span></a>
                <a href="<?php echo e(route('shopping-cart.view')); ?>" class="menu-item user-item <?php if(Route::currentRouteName() == 'shopping-cart.view'): ?> active <?php endif; ?> position-relative"><i class="fa-regular fa-cart-shopping"></i> <span>Sepetim</span>
                  <div class="position-absolute bottom-0 start-100 translate-middle badge rounded-pill bg-primary shopping-cart-count-badge"></div></a>
                <?php $__currentLoopData = $lists; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $liste): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a href="<?php echo e(route('list.view', $liste->slug)); ?>" class="menu-item menu-item-<?php echo e($liste->color); ?> list-item <?php if(request()->path() == "liste/{$liste->slug}"): ?> active active-<?php echo e($liste->color); ?> <?php endif; ?>"><i class="fa-regular <?php echo e($liste->icon); ?>"></i> <span><?php echo e($liste->name); ?></span></a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
</div>

<div class="offcanvas offcanvas-start" tabindex="-1" id="allCategoriesOffCanvas" aria-labelledby="allCategoriesOffCanvasLabel">
    <div class="offcanvas-header">
        <a href="#" class="offcanvas-title" id="allCategoriesOffCanvasLabel">
          <?php if (isset($component)) { $__componentOriginal40b9bc8bbe72b013cda6958fd160ce72 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72 = $attributes; } ?>
<?php $component = App\View\Components\ApplicationLogo::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('application-logo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ApplicationLogo::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72)): ?>
<?php $attributes = $__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72; ?>
<?php unset($__attributesOriginal40b9bc8bbe72b013cda6958fd160ce72); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal40b9bc8bbe72b013cda6958fd160ce72)): ?>
<?php $component = $__componentOriginal40b9bc8bbe72b013cda6958fd160ce72; ?>
<?php unset($__componentOriginal40b9bc8bbe72b013cda6958fd160ce72); ?>
<?php endif; ?>
        </a>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <ul class="offcanvas-menu">
        <li class="menu-item <?php if(request()->path() == "tum-urunler"): ?> active <?php endif; ?>">
          <a href="<?php echo e(route('allProducts.view')); ?>">Tüm Ürünler</a>
        </li>
        <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
          <li class="menu-item <?php if(request()->path() == "kategoriler/{$category->slug}"): ?> active open <?php endif; ?> <?php $__currentLoopData = $category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> <?php if(request()->path() == "kategoriler/{$sub_category->slug}"): ?> active open <?php else: ?> <?php $__currentLoopData = $sub_category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>  <?php if(request()->path() == "kategoriler/{$child_category->slug}"): ?> active open <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>">
            <a href=<?php if(!count($category->child_categories) > 0): ?>"<?php echo e(route('category.view', $category->slug)); ?>"<?php else: ?>"Javascript:void(0);"<?php endif; ?>><?php echo e($category->name); ?> <?php if(count($category->child_categories) > 0): ?>  <i class="fa-solid <?php $thisopenstatus = false; ?> <?php if(request()->path() == "kategoriler/{$category->slug}"): ?> fa-chevron-down <?php $thisopenstatus = true; ?> <?php else: ?> <?php $__currentLoopData = $category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> <?php if(request()->path() == "kategoriler/{$sub_category->slug}"): ?> fa-chevron-down <?php $thisopenstatus = true; ?> <?php else: ?> <?php $__currentLoopData = $sub_category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>  <?php if(request()->path() == "kategoriler/{$child_category->slug}"): ?> fa-chevron-down <?php $thisopenstatus = true; ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php if($thisopenstatus == false): ?> fa-chevron-right <?php endif; ?>"></i> <?php endif; ?></a>
            <?php if(count($category->child_categories) > 0): ?>
            <ul class="menu-sub">
              <li class="menu-item <?php if(request()->path() == "kategoriler/{$category->slug}"): ?> active <?php endif; ?>">
                <a href="<?php echo e(route('category.view', $category->slug)); ?>"><?php echo e($category->name); ?> Kategorisindeki Her Şey</a>
              </li>
              <?php $__currentLoopData = $category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li class="menu-item <?php if(request()->path() == "kategoriler/{$subCategory->slug}"): ?> active open <?php endif; ?> <?php $__currentLoopData = $subCategory->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> <?php if(request()->path() == "kategoriler/{$sub_category->slug}"): ?> active open <?php else: ?> <?php $__currentLoopData = $sub_category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>  <?php if(request()->path() == "kategoriler/{$child_category->slug}"): ?> active open <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>">
                  <a href=<?php if(!count($subCategory->child_categories) > 0): ?>"<?php echo e(route('category.view', $subCategory->slug)); ?>"<?php else: ?>"Javascript:void(0);"<?php endif; ?>><?php echo e($subCategory->name); ?> <?php if(count($subCategory->child_categories) > 0): ?>  <i class="fa-solid <?php $thisopenstatus = false; ?> <?php if(request()->path() == "kategoriler/{$category->slug}"): ?> fa-chevron-down <?php $thisopenstatus = true; ?> <?php else: ?> <?php $__currentLoopData = $category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> <?php if(request()->path() == "kategoriler/{$sub_category->slug}"): ?> fa-chevron-down <?php $thisopenstatus = true; ?> <?php else: ?> <?php $__currentLoopData = $sub_category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>  <?php if(request()->path() == "kategoriler/{$child_category->slug}"): ?> fa-chevron-down <?php $thisopenstatus = true; ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php if($thisopenstatus == false): ?> fa-chevron-right <?php endif; ?>"></i> <?php endif; ?></a>
                  <?php if(count($subCategory->child_categories) > 0): ?>
                  <ul class="menu-sub">
                    <li class="menu-item <?php if(request()->path() == "kategoriler/{$subCategory->slug}"): ?> active <?php endif; ?>">
                      <a href="<?php echo e(route('category.view', $subCategory->slug)); ?>"><?php echo e($subCategory->name); ?> Kategorisindeki Her Şey</a>
                    </li>
                    <?php $__currentLoopData = $subCategory->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                      <li class="menu-item <?php if(request()->path() == "kategoriler/{$child_category->slug}"): ?> active <?php endif; ?> <?php $__currentLoopData = $child_category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> <?php if(request()->path() == "kategoriler/{$sub_category->slug}"): ?> active open <?php else: ?> <?php $__currentLoopData = $sub_category->child_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>  <?php if(request()->path() == "kategoriler/{$child_category->slug}"): ?> active open <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> <?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>">
                        <a href="<?php echo e(route('category.view', $child_category->slug)); ?>"><?php echo e($child_category->name); ?></a>
                      </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                  </ul>
                  <?php endif; ?>
                </li>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
            <?php endif; ?>
          </li>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
      </ul>
    </div>
  </div><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/layouts/navbar.blade.php ENDPATH**/ ?>