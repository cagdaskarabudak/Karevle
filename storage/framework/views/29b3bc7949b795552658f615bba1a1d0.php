<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Profilim'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
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
        <form action="<?php echo e(route('user.profile.post')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div class="mb-3">
                <label for="user_avatar" class="user_avatar_label">
                    <?php if(Auth::user()->avatar != null): ?> 
                    <img src="/storage/<?php echo e(Auth::user()->avatar); ?>" class="user_avatar_preview_img" alt="">
                    <?php else: ?>
                    <div class="text-avatar"><?php echo e(mb_substr(Auth::user()->first_name, 0, 1).mb_substr(Auth::user()->last_name, 0, 1)); ?></div>
                    <?php endif; ?>
                    <div class="select-text">Yeni Görüntü Seç</div>
                </label>
                <input type="file" id="user_avatar" name="user_avatar">
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">İsim Soyisim</label>
                <div class="input-group input-group-merge">
                    <input class="form-control" type="text" name="first_name" id="first_name" placeholder="İsim" value="<?php echo e(Auth::user()->first_name); ?>" required>
                    <input class="form-control" type="text" name="last_name" id="last_name" placeholder="Soyisim" value="<?php echo e(Auth::user()->last_name); ?>" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Kullanıcı Adı</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Kullanıcı Adı" value="<?php echo e(Auth::user()->username); ?>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">E-Posta</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="E-Posta" value="<?php echo e(Auth::user()->email); ?>" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Telefon</label>
                <input type="number" class="form-control" name="phone" id="phone" placeholder="Telefon 5xxxxxxxxx" value="<?php echo e(Auth::user()->phone); ?>" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Şifre Değişikliği</label>
                <input class="form-control mb-3" type="password" name="old_password" id="old_password" placeholder="Mevcut Şifre">
                <div class="input-group input-group-merge">
                    <input class="form-control" type="password" name="password" id="password" placeholder="Yeni Şifre">
                    <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" placeholder="Yeni Şifre Tekrar">
                </div>
            </div>
            <button class="btn btn-success text-light" type="submit">Kaydet</button>
            <?php if($errors->any()): ?>
            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
             <?php echo e($error); ?>

             <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
            <?php if(session('error')): ?>
            <?php echo e(session('error')); ?>

            <?php endif; ?>
            <?php if(session('successes')): ?>
            <?php $__currentLoopData = session('successes'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $success): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php echo e($success); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
        </form>
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
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/auth/profile.blade.php ENDPATH**/ ?>