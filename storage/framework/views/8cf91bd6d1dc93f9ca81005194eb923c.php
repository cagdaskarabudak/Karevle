<div class="row">
    <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="card shopping-cart-total-card mb-3">
            <div class="card-body">
            </div>
            <div class="card-footer">
                <div class="total-price">
                    <span class="text">Toplam: </span>
                    <span class="value"> TL</span>
                </div>
                <a href=<?php if(count($baskets) > 0): ?> "#" <?php else: ?> "Javascript:void(0);" <?php endif; ?> type="button" class="shopping-cart-submit-btn btn btn-success text-light">Sepeti Onayla</a>
                <a href="#" type="button" class="shopping-cart-clean">Sepeti Temizle</a>
            </div>
        </div>
        <div class="card shopping-cart-coupon-card mb-3">
            <div class="card-body">
                <div class="input-group">
                    <input type="text" class="form-control coupon-code-input" name="coupon_code" id="coupon_code" placeholder="Kupon Kodu Gir">
                    <a href="#" class="btn btn-primary text-light coupon-code-add-btn">Ekle</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-9 col-md-12 col-sm-12">
        <div class="card products-card shopping-cart-products-card products-card-danger">
            <div class="card-body empty">
                <?php $__currentLoopData = $baskets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $basket): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if (isset($component)) { $__componentOriginalef7a86fdd51d8850eca71e524d808a86 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalef7a86fdd51d8850eca71e524d808a86 = $attributes; } ?>
<?php $component = App\View\Components\ShoppingCartProductCard::resolve(['basket' => $basket] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('shopping-cart-product-card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ShoppingCartProductCard::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalef7a86fdd51d8850eca71e524d808a86)): ?>
<?php $attributes = $__attributesOriginalef7a86fdd51d8850eca71e524d808a86; ?>
<?php unset($__attributesOriginalef7a86fdd51d8850eca71e524d808a86); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalef7a86fdd51d8850eca71e524d808a86)): ?>
<?php $component = $__componentOriginalef7a86fdd51d8850eca71e524d808a86; ?>
<?php unset($__componentOriginalef7a86fdd51d8850eca71e524d808a86); ?>
<?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <div class="message">
                    <span>Sepetiniz Boş! </span>
                    <a href="<?php echo e(route('home')); ?>" class="btn btn-success text-light"> <i class="fa-solid fa-cart-shopping"></i> Alışverişe başla</a></div>
            </div>
        </div>
    </div>
</div>

<script type="module">
shoppingCardTotalUpdate();
</script><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/components/shopping-cart-list.blade.php ENDPATH**/ ?>