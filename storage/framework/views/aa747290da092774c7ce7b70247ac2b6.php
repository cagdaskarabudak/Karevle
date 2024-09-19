<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => 'Register'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card register-card">
                <div class="card-body">
                    <form action="<?php echo e(route('register.post')); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <div class="mb-3">
                            <label for="username" class="form-label">İsim Soyisim</label>
                            <div class="input-group input-group-merge">
                                <input class="form-control" type="text" name="first_name" id="first_name" placeholder="İsim" value="<?php echo e(old('first_name')); ?>" required>
                                <input class="form-control" type="text" name="last_name" id="last_name" placeholder="Soyisim" value="<?php echo e(old('last_name')); ?>" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label">Kullanıcı Adı</label>
                            <input type="text" class="form-control" name="username" id="username" placeholder="Kullanıcı Adı" value="<?php echo e(old('username')); ?>" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">E-Posta</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="E-Posta" value="<?php echo e(old('email')); ?>" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Telefon</label>
                            <input type="number" class="form-control" name="phone" id="phone" placeholder="Telefon 5xxxxxxxxx" value="<?php echo e(old('phone')); ?>" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Şifre</label>
                            <div class="input-group input-group-merge">
                                <input class="form-control" type="password" name="password" id="password" placeholder="Şifre" required>
                                <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" placeholder="Şifre Tekrar" required>
                            </div>
                        </div>
                        <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="kvkk" name="kvkk">
                                <label for="kvkk" class="form-check-label">KVKK Metnini Okudum, Anladım ve Onaylıyorum.</label>
                            </div>
                            <button class="btn btn-success text-light" type="submit">Üye Ol</button>
                            <?php if($errors->any()): ?>
                            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php echo e($error); ?>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                            <?php if(session('error')): ?>
                            <?php echo e(session('error')); ?>

                            <?php endif; ?>
                        </div>
                    </form>
                </div>
                <div class="card-footer" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                    Zaten üye misin? <a href="<?php echo e(route('login.view')); ?>" class="text-primary text-decoration-none">Giriş Yap</a>
                </div>
            </div>
        </div>
    </div>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3)): ?>
<?php $attributes = $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3; ?>
<?php unset($__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3)): ?>
<?php $component = $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3; ?>
<?php unset($__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3); ?>
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/auth/register.blade.php ENDPATH**/ ?>