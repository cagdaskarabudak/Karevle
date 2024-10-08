<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo e($title); ?> - <?php echo e(env('APP_NAME')); ?></title>
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="<?php echo e(Storage::url('main_images/favicon.svg')); ?>">
        <?php echo app('Illuminate\Foundation\Vite')(['resources/sass/app.sass', 'resources/js/app.js']); ?>
    </head>
    <body>
            <?php echo $__env->make('layouts.loading-screen', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php echo $__env->make('layouts.dashboard-navbar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="content-wrapper">
                <div class="container">
                    <?php echo e($slot); ?>

                </div>
            </div>
            <?php echo $__env->make('layouts.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="toast-container position-fixed top-0 end-0 p-3">
    
            </div>
    </body>

      <script type="module">

        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

        <?php if(session('autherror')): ?>
            mainmethods.createToast("<?php echo e(session('autherror')); ?>");
        <?php endif; ?>

      </script>
</html>
<?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/components/dashboard-page.blade.php ENDPATH**/ ?>