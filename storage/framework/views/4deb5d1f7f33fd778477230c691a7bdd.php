<div class="product-card"
        id="productCard<?php echo e($product->id); ?>"
        data-rate="<?php echo e($product->rate); ?>" 
        data-keys="<?php $__currentLoopData = $product->keys; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prKey): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><?php echo e($prKey); ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>" 
        data-price="<?php echo e($product->price); ?>"
        data-created-at="<?php echo e($product->created_at); ?>"
        data-gender-category=<?php $__currentLoopData = $product->category->getTopMostCategory(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $topmostcategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><?php if($loop->first): ?>"<?php echo e($topmostcategory->name); ?>"<?php endif; ?> <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    >
    <div class="product-tags">
        <?php $__currentLoopData = $product->lists; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $list): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="tag tag-<?php echo e($list->color); ?>">
                <i class="fa-solid <?php echo e($list->icon); ?>"></i> <?php echo e($list->short_name); ?>

            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
    <?php if(Auth::check()): ?>
    <button class="product-favorite-btn <?php if($product->isFavoritedUser(Auth::user()->id)): ?> favorited <?php endif; ?>" data-product-id="<?php echo e($product->id); ?>"><i class="<?php if($product->isFavoritedUser(Auth::user()->id)): ?> fa-solid fa-heart-circle-check <?php else: ?> fa-regular fa-heart <?php endif; ?>"></i></button>
    <?php endif; ?>
    <div class="product-images">
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
            <?php $__currentLoopData = $product->images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="swiper-slide">
                <img src="/storage/product_images/<?php echo e($image->name); ?>" alt="">
            </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <div class="swiper-scrollbar"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="product-info">
        <div class="name"><?php echo e($product->name); ?></div>
        <div class="rate">
            <span class="rating"><?php echo e($product->rate); ?></span>
            <div class="rating-stars"></div>
            <span class="total-comments">(<?php echo e(count($product->comments)); ?>)</span>
        </div>
        <div class="price"><?php echo e($product->price); ?> TL</div>
    </div>
    <div class="product-footer">
        <button class="shopping-card-btn"><i class="fa-solid fa-cart-shopping"></i><span>Sepete Ekle</span></button>
        <button class="detail-btn"><i class="fa-solid fa-eye"></i><span>İncele</span></button>
    </div>
</div>

<script type="module">
    $('.product-card#productCard<?php echo e($product->id); ?> .product-info .rate .rating-stars').rateYo({
        rating: $('.product-card#productCard<?php echo e($product->id); ?>').attr('data-rate'),
        starWidth: "14px",
        readOnly: true
    });

    let swiperloop = null;

    if(window.innerWidth <= 991){
        swiperloop = true;
    }
    else if(window.innerWidth >= 992){
        swiperloop = false;
    }

    let product<?php echo e($product->id); ?>Swiper = new Swiper('.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper', {
        slidesPerView: 1,
        scrollbar: {
            enabled: true,
            el: '.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper .swiper-scrollbar',
        },
        pagination: {
            el: '.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper .swiper-pagination',
        },
        loop: swiperloop,
        speed: 500
    });

    let startX = 0; // Başlangıç x koordinatı

    document.querySelector('.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper').addEventListener('mousemove', function(event) {
        if (startX === 0) {
            startX = event.clientX; // İlk fare pozisyonunu kaydet
        }

        let currentX = event.clientX; // Şu anki fare pozisyonu
        let deltaX = currentX - startX; // Hareket yönü ve mesafesi
        let slides = document.querySelectorAll('.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper .swiper-wrapper .swiper-slide');
        let threshold = 100 / slides.length;

        if (deltaX > threshold) { // Sağ tarafa kaydırma
            product<?php echo e($product->id); ?>Swiper.slideNext();
            startX = currentX; // Yeni başlangıç pozisyonu
        } else if (deltaX < -threshold) { // Sol tarafa kaydırma
            product<?php echo e($product->id); ?>Swiper.slidePrev();
            startX = currentX; // Yeni başlangıç pozisyonu
        }
    });

    document.querySelector('.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper').addEventListener('mouseleave', function() {
        product<?php echo e($product->id); ?>Swiper.slideTo(0);
    });

    document.querySelector('.product-card#productCard<?php echo e($product->id); ?> .product-images .swiper').addEventListener('mouseenter', function() {
        product<?php echo e($product->id); ?>Swiper.slideTo(0);
    });
</script><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/components/product-card.blade.php ENDPATH**/ ?>