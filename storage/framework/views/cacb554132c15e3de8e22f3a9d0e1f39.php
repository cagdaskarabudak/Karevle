<?php if (isset($component)) { $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3 = $attributes; } ?>
<?php $component = App\View\Components\Page::resolve(['title' => $product->name] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\Page::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <div class="row">
        <div class="col-lg-12">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item text-primary" style="font-size: 10pt"><a class="text-decoration-none text-primary" style="font-size: 10pt" href="<?php echo e(route('home')); ?>"><img src="<?php echo e(asset('storage/main_images/favicon.svg')); ?>" alt="Favicon" height="24pt"><?php echo e(env('APP_NAME')); ?></a></li>
                  <?php $__currentLoopData = $product->category->getTopMostCategory(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $topCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li class="breadcrumb-item text-secondary" aria-current="page" style="font-size: 10pt"> <a class="text-decoration-none text-secondary" style="font-size: 10pt" href="<?php echo e(route('category.view', $topCategory->slug)); ?>"><?php echo e($topCategory->name); ?></a></li>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ol>
            </nav>
        </div>
        <div class="col-lg-4 product-images-card mb-3">
            <div class="swiper product-images-swiper">
                <div class="swiper-wrapper">
                    <?php $__currentLoopData = $product->medias; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $media): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="swiper-slide">
                        <?php if($media->type == 'video'): ?>
                            <video muted loop>
                                <source src="/storage/product_medias/<?php echo e($media->name); ?>" type="video/mp4">
                            </video>
                        <?php elseif($media->type == 'image'): ?>
                            <img src="/storage/product_medias/<?php echo e($media->name); ?>">
                        <?php endif; ?>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
            <div class="swiper-navigation">
                <button class="prev-btn"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="next-btn"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
            <div class="swiper-pagination"></div>
        </div>
        <div class="col-lg-8">
            <div class="card product-info-card">
                <div class="card-body">
                    <div class="product-lists ">
                        <?php $__currentLoopData = $product->lists; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $liste): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="product-list product-list-<?php echo e($liste->color); ?>"><i class="fa-solid <?php echo e($liste->icon); ?>"></i>  <?php echo e($liste->short_name); ?></div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                    <div class="product-info">
                        <div class="name">
                            <?php echo e($product->name); ?>

                        </div>
                        <div class="rate">
                            <div class="rating-amount"><?php echo e($product->rate); ?></div>
                            <div class="rating-stars"></div>
                            <div class="rating-count">(<?php echo e(count($product->comments)); ?>)</div>
                        </div>
                        <div class="price"><?php echo e(number_format($product->price, 2, ',', '.')); ?> TL</div>
                    </div>
                </div>
            </div>
            <div class="product-action-buttons">
                <a href="Javascript:void(0);" class="shopping-card-btn" data-id="<?php echo e($product->id); ?>"><i class="fa-solid fa-shopping-cart"></i><span>SEPETE EKLE</span></a>
                <?php if(auth()->guard()->check()): ?> <a href="Javascript:void(0);" data-product-id="<?php echo e($product->id); ?>" class="add-favorites-btn <?php if($product->isFavoritedUser(Auth::user()->id)): ?> favorited <?php endif; ?>"><i class="fa-solid <?php if($product->isFavoritedUser(Auth::user()->id)): ?> fa-heart-circle-check <?php else: ?> fa-heart <?php endif; ?>"></i></a> <?php endif; ?>
            </div>
        </div>
        <?php if($product->content): ?>
        <div class="col-lg-12">
            <div class="card mt-3">
                <div class="card-body">
                    <div class="product-content">
                        <?php echo e($product->content->content); ?>

                    </div>
                </div>
            </div>
        </div>
        <?php endif; ?>
        <div class="col-lg-12 product-comments">
            <?php $__currentLoopData = $product->comments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $comment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="product-comment">
                <div class="comment-header"><?php echo e($comment->user->first_name.' '.$comment->user->last_name); ?></div>
                <div class="comment-body"><?php echo e($comment->comment); ?></div>
                <?php if(count($comment->medias) > 0): ?>
                <div class="comment-medias">
                    <?php $__currentLoopData = $comment->medias; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $media): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="comment-media">
                        <button class="btn btn-dark text-light close-btn"><i class="fa-solid fa-x"></i></button>
                        <?php if($media->type == 'image'): ?>
                        <img class="" src="/storage/comment_medias/<?php echo e($media->name); ?>">
                        <?php elseif($media->type == 'video'): ?>
                        <div class="icon"><i class="fa-solid fa-play"></i></div>
                        <video loop muted>
                            <source src="/storage/comment_medias/<?php echo e($media->name); ?>" type="video/mp4">
                        </video>
                        <?php endif; ?>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
                <?php endif; ?>
                <div class="comment-footer"> <div class="comment-rating"><div class="comment-rating-amount" data-rate="<?php echo e($comment->rate); ?>"><?php echo e($comment->rate); ?></div><div class="comment-rating-stars"></div></div><div class="created-date"><?php echo e($comment->created_at); ?></div></div>
            </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
    <script type="module">
        let productMedias = <?php echo json_encode($product->medias, 15, 512) ?>;
        new Swiper('.swiper.product-images-swiper', {
            slidesPerView: 1,
            navigation: {
                nextEl: '.product-images-card .next-btn',
                prevEl: '.product-images-card .prev-btn',
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            loop: true
        });

        $('.rating-stars').rateYo({
            rating: <?php echo json_encode($product->rate, 15, 512) ?>,
            starWidth: "15px",
            readOnly: true
        });

        const slideVideos = document.querySelectorAll('.swiper-slide video');

        if(slideVideos){
            slideVideos.forEach(slideVideo => {
                // Mouse üzerine geldiğinde video baştan başlasın ve oynasın
                slideVideo.addEventListener('mouseover', () => {
                    slideVideo.currentTime = 0;  // Video baştan başlasın
                    slideVideo.play();  // Video oynat
                });
                slideVideo.addEventListener('touchstart', (e) => {
                    e.preventDefault();
                    slideVideo.currentTime = 0;  // Video baştan başlasın
                    slideVideo.play();  // Video oynat
                });

                // Mouse videonun üzerinden ayrıldığında video başa dönsün ve durdurulsun
                slideVideo.addEventListener('mouseout', () => {
                    slideVideo.pause();  // Video durdur
                    slideVideo.currentTime = 0;  // Video başa sar
                });
                slideVideo.addEventListener('touchend', (e) => {
                    slideVideo.pause();  // Video durdur
                    slideVideo.currentTime = 0;  // Video başa sar
                });
                slideVideo.addEventListener('touchcancel', (e) => {
                    slideVideo.pause();  // Video durdur
                    slideVideo.currentTime = 0;  // Video başa sar
                });
            });
        }

        const commentMedias = document.querySelectorAll('.comment-media');
        if(commentMedias){
            commentMedias.forEach(commentMedia => {
                commentMedia.addEventListener('click', function(e){
                    if(commentMedia.classList.contains('show')){
                        if(e.target != commentMedia.querySelector('img') && e.target != commentMedia.querySelector('video')){
                            commentMedia.classList.remove('show');
                            let video = commentMedia.querySelector('video');
                            if(video && !video.paused){
                                video.currentTime = 0;
                                video.pause();
                                $(commentMedia.querySelector('.icon')).show();
                            }
                        }
                        if(e.target == commentMedia.querySelector('video')){
                            let video = commentMedia.querySelector('video');
                            if(video){
                                if(video.paused){
                                    video.play();
                                    $(commentMedia.querySelector('.icon')).hide();
                                }
                                else{
                                    video.pause();
                                    $(commentMedia.querySelector('.icon')).show();
                                }
                            }
                        }
                    }
                    else{
                        commentMedia.classList.add('show');
                        let video = commentMedia.querySelector('video');
                            if(video){
                                video.currentTime = 0;
                                video.play();
                                $(commentMedia.querySelector('.icon')).hide();
                            }
                    }
                });
            });
        }
    </script>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3)): ?>
<?php $attributes = $__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3; ?>
<?php unset($__attributesOriginalbb0f46e9c87d433ff2eb407e479a8ac3); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3)): ?>
<?php $component = $__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3; ?>
<?php unset($__componentOriginalbb0f46e9c87d433ff2eb407e479a8ac3); ?>
<?php endif; ?><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/product.blade.php ENDPATH**/ ?>