<?php if (isset($component)) { $__componentOriginalf90d06f3950b13210f04294c7b9d80bd = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalf90d06f3950b13210f04294c7b9d80bd = $attributes; } ?>
<?php $component = App\View\Components\DashboardPage::resolve(['title' => 'Ana Sayfa - Yönetim Paneli'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('dashboard-page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\DashboardPage::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalf90d06f3950b13210f04294c7b9d80bd)): ?>
<?php $attributes = $__attributesOriginalf90d06f3950b13210f04294c7b9d80bd; ?>
<?php unset($__attributesOriginalf90d06f3950b13210f04294c7b9d80bd); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalf90d06f3950b13210f04294c7b9d80bd)): ?>
<?php $component = $__componentOriginalf90d06f3950b13210f04294c7b9d80bd; ?>
<?php unset($__componentOriginalf90d06f3950b13210f04294c7b9d80bd); ?>
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/dashboard/home.blade.php ENDPATH**/ ?>