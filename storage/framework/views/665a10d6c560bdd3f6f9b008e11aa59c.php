<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Adreslerim'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <?php if (isset($component)) { $__componentOriginald37ab9159f33ee4ab08f15873d4c9677 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginald37ab9159f33ee4ab08f15873d4c9677 = $attributes; } ?>
<?php $component = App\View\Components\Account::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('account'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Account::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
        <a href="<?php echo e(route('user.addresses.create')); ?>" class="btn btn-success text-light">Yeni Adres Ekle</a>
        <hr />
        <div class="address-list">
            <?php $__empty_1 = true; $__currentLoopData = Auth::user()->addresses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $address): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <div class="address <?php if($address->is_default == 1): ?> default <?php endif; ?>">
                    <div class="header">
                        <div class="title">
                            <?php echo e($address->title); ?>

                        </div>
                        <div class="city">
                            <?php echo e($address->city); ?>

                        </div>
                    </div>
                    <div class="body">
                        <?php echo e($address->address); ?>

                    </div>
                    <div class="footer">
                        <a href="Javascript:void(0);" class="btn btn-danger text-light btn-sm address-delete-btn" data-id="<?php echo e($address->id); ?>"> <i class="fa-solid fa-trash"></i> Sil</a>
                        <a href="<?php echo e(route('user.addresses.edit', $address->id)); ?>" class="btn btn-info text-light btn-sm" data-id="<?php echo e($address->id); ?>"> <i class="fa-solid fa-pencil"></i> Düzenle</a>
                        <?php if(!$address->is_default == 1): ?> <a href="Javascript:void(0);" class="btn btn-warning text-light btn-sm address-default-btn" data-id="<?php echo e($address->id); ?>"> Varsayılan Yap</a><?php endif; ?>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                Adresiniz yok.
            <?php endif; ?>
        </div>
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginald37ab9159f33ee4ab08f15873d4c9677)): ?>
<?php $attributes = $__attributesOriginald37ab9159f33ee4ab08f15873d4c9677; ?>
<?php unset($__attributesOriginald37ab9159f33ee4ab08f15873d4c9677); ?>
<?php endif; ?>
<?php if (isset($__componentOriginald37ab9159f33ee4ab08f15873d4c9677)): ?>
<?php $component = $__componentOriginald37ab9159f33ee4ab08f15873d4c9677; ?>
<?php unset($__componentOriginald37ab9159f33ee4ab08f15873d4c9677); ?>
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
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/user/addresses.blade.php ENDPATH**/ ?>