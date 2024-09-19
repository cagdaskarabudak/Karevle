<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Favorilerim'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <div class="col-lg-12">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item text-primary" style="font-size: 10pt"><a class="text-decoration-none text-primary" style="font-size: 10pt" href="<?php echo e(route('home')); ?>"><img src="<?php echo e(asset('storage/main_images/favicon.svg')); ?>" alt="Favicon" height="24pt"><?php echo e(env('APP_NAME')); ?></a></li>
                <li class="breadcrumb-item active text-danger" aria-current="page" style="font-size: 10pt;"><i class="fa-solid fa-heart"></i> Favorilerim</li>
            </ol>
        </nav>
    </div>
    <div class="col-lg-12 p-1">
        <div class="count-info">
            <?php echo e(count(Auth::user()->favorites)); ?> Ürün listeleniyor.
        </div>
    </div>
    <?php if (isset($component)) { $__componentOriginal27fa7f6b4a3d0b3e643bad606b16e52b = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal27fa7f6b4a3d0b3e643bad606b16e52b = $attributes; } ?>
<?php $component = App\View\Components\ProductList::resolve(['products' => Auth::user()->favorites] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('product-list'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ProductList::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal27fa7f6b4a3d0b3e643bad606b16e52b)): ?>
<?php $attributes = $__attributesOriginal27fa7f6b4a3d0b3e643bad606b16e52b; ?>
<?php unset($__attributesOriginal27fa7f6b4a3d0b3e643bad606b16e52b); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal27fa7f6b4a3d0b3e643bad606b16e52b)): ?>
<?php $component = $__componentOriginal27fa7f6b4a3d0b3e643bad606b16e52b; ?>
<?php unset($__componentOriginal27fa7f6b4a3d0b3e643bad606b16e52b); ?>
<?php endif; ?>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3)): ?>
<?php $attributes = $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3; ?>
<?php unset($__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3)): ?>
<?php $component = $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3; ?>
<?php unset($__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3); ?>
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/auth/favorites.blade.php ENDPATH**/ ?>