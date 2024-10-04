<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Ödeme'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <?php if (isset($component)) { $__componentOriginal9faefaaa0323db3ff1ed7b76c9bd92d9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal9faefaaa0323db3ff1ed7b76c9bd92d9 = $attributes; } ?>
<?php $component = App\View\Components\ShoppingCartPayment::resolve(['baskets' => $baskets] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('shopping-cart-payment'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ShoppingCartPayment::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal9faefaaa0323db3ff1ed7b76c9bd92d9)): ?>
<?php $attributes = $__attributesOriginal9faefaaa0323db3ff1ed7b76c9bd92d9; ?>
<?php unset($__attributesOriginal9faefaaa0323db3ff1ed7b76c9bd92d9); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal9faefaaa0323db3ff1ed7b76c9bd92d9)): ?>
<?php $component = $__componentOriginal9faefaaa0323db3ff1ed7b76c9bd92d9; ?>
<?php unset($__componentOriginal9faefaaa0323db3ff1ed7b76c9bd92d9); ?>
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
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/shopping-cart/shopping-cart-payment.blade.php ENDPATH**/ ?>