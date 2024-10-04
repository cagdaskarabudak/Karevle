<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Sepetim'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <?php if (isset($component)) { $__componentOriginalbc9f7e286e9c524cdc2b83a843cffb65 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbc9f7e286e9c524cdc2b83a843cffb65 = $attributes; } ?>
<?php $component = App\View\Components\ShoppingCartList::resolve(['baskets' => $baskets] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('shopping-cart-list'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ShoppingCartList::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalbc9f7e286e9c524cdc2b83a843cffb65)): ?>
<?php $attributes = $__attributesOriginalbc9f7e286e9c524cdc2b83a843cffb65; ?>
<?php unset($__attributesOriginalbc9f7e286e9c524cdc2b83a843cffb65); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalbc9f7e286e9c524cdc2b83a843cffb65)): ?>
<?php $component = $__componentOriginalbc9f7e286e9c524cdc2b83a843cffb65; ?>
<?php unset($__componentOriginalbc9f7e286e9c524cdc2b83a843cffb65); ?>
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
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/shopping-cart/shopping-cart.blade.php ENDPATH**/ ?>