<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Adres Bilgileri'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <?php if (isset($component)) { $__componentOriginale4093e75a1da87661ab24109acbcbc8d = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginale4093e75a1da87661ab24109acbcbc8d = $attributes; } ?>
<?php $component = App\View\Components\ShoppingCartConfirm::resolve(['baskets' => $baskets,'address' => $address,'iaddress' => $invoice_address] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('shopping-cart-confirm'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ShoppingCartConfirm::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginale4093e75a1da87661ab24109acbcbc8d)): ?>
<?php $attributes = $__attributesOriginale4093e75a1da87661ab24109acbcbc8d; ?>
<?php unset($__attributesOriginale4093e75a1da87661ab24109acbcbc8d); ?>
<?php endif; ?>
<?php if (isset($__componentOriginale4093e75a1da87661ab24109acbcbc8d)): ?>
<?php $component = $__componentOriginale4093e75a1da87661ab24109acbcbc8d; ?>
<?php unset($__componentOriginale4093e75a1da87661ab24109acbcbc8d); ?>
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
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/shopping-cart/shopping-cart-confirm.blade.php ENDPATH**/ ?>