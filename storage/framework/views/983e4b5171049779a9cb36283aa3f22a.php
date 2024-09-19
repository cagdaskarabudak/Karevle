<div class="row justify-content-center">
    <div class="col-lg-3 mb-3">
        <div class="card nav-card">
            <div class="card-body">
                <a href="<?php echo e(route('user.profile')); ?>" class="nav-item <?php if(Route::currentRouteName() == 'user.profile'): ?> active <?php endif; ?>">Hesap Ayarlarım</a>
                <a href="<?php echo e(route('user.orders')); ?>" class="nav-item <?php if(Route::currentRouteName() == 'user.orders'): ?> active <?php endif; ?>">Siparişlerim</a>
                <a href="<?php echo e(route('user.addresses')); ?>" class="nav-item <?php if(Route::currentRouteName() == 'user.addresses'): ?> active <?php endif; ?>">Adreslerim</a>
                <a href="<?php echo e(route('user.coupons')); ?>" class="nav-item <?php if(Route::currentRouteName() == 'user.coupons'): ?> active <?php endif; ?>">Kuponlarım</a>
            </div>
        </div>
    </div>
    <div class="col-lg-9">
        <div class="card">
            <div class="card-body">
                <?php echo e($slot); ?>

            </div>
        </div>
    </div>
</div><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/components/account.blade.php ENDPATH**/ ?>