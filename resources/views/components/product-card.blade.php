<div class="product-card" aria-disabled="true"
        id="productCard{{ $product->id }}"
        data-rate="{{ $product->rate }}" 
        data-keys="@foreach($product->keys as $prKey){{ $prKey }} @endforeach" 
        data-price="{{ $product->price }}"
        data-created-at="{{ $product->created_at }}"
        data-gender-category=@foreach($product->category->getTopMostCategory() as $topmostcategory)@if($loop->first)"{{ $topmostcategory->name }}"@endif @endforeach
    >
    <div class="product-tags">
        @foreach($product->lists as $list)
            <div class="tag tag-{{ $list->color }}">
                <i class="fa-solid {{ $list->icon }}"></i> {{ $list->short_name }}
            </div>
        @endforeach
    </div>
    @if(Auth::check())
    <button class="product-favorite-btn @if($product->isFavoritedUser(Auth::user()->id)) favorited @endif" data-product-id="{{ $product->id }}"><i class="@if($product->isFavoritedUser(Auth::user()->id)) fa-solid fa-heart-circle-check @else fa-regular fa-heart @endif"></i></button>
    @endif
    <div class="product-images">
        <div class="swiper">
            <div class="swiper-wrapper">
                @foreach($product->medias as $media)
                <div class="swiper-slide">
                    @if($media->type == 'video')
                        <video muted loop>
                            <source src="/storage/product_medias/{{ $media->name }}" type="video/mp4">
                        </video>
                    @elseif($media->type == 'image')
                        <img src="/storage/product_medias/{{ $media->name }}" alt="">
                    @endif
                </div>
                @endforeach
            </div>
            <div class="swiper-scrollbar"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="product-info">
        <div class="name">{{ $product->name }}</div>
        <div class="rate">
            <span class="rating">{{ $product->rate }}</span>
            <div class="rating-stars"></div>
            <span class="total-comments">({{ count($product->comments) }})</span>
        </div>
        <div class="price">{{ number_format($product->price, 2, ',', '.') }} TL</div>
    </div>
    <div class="product-footer">
        <a href="Javascript:void(0);" type="button" class="shopping-card-btn" data-id="{{ $product->id }}"><i class="fa-solid @if($product->isInBasket(Session::getId())) fa-cart-circle-check @else fa-cart-shopping @endif"></i><span>Sepete Ekle</span></a>
        <a href="{{ route('product.show', $product->slug) }}" type="button" class="detail-btn"><i class="fa-solid fa-eye"></i><span>İncele</span></a>
    </div>
</div>

<script type="module">
    $('.product-card#productCard{{$product->id}} .product-info .rate .rating-stars').rateYo({
        rating: $('.product-card#productCard{{$product->id}}').attr('data-rate'),
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

    let product{{$product->id}}Swiper = new Swiper('.product-card#productCard{{$product->id}} .product-images .swiper', {
        slidesPerView: 1,
        effect: "fade",
        scrollbar: {
            enabled: true,
            el: '.product-card#productCard{{$product->id}} .product-images .swiper .swiper-scrollbar',
        },
        pagination: {
            el: '.product-card#productCard{{$product->id}} .product-images .swiper .swiper-pagination',
        },
        loop: swiperloop,
        speed: 0
    });

    let startX = 0; // Başlangıç x koordinatı

    document.querySelector('.product-card#productCard{{$product->id}} .product-images .swiper').addEventListener('mousemove', function(event) {
        if (startX === 0) {
            startX = event.clientX; // İlk fare pozisyonunu kaydet
        }

        let currentX = event.clientX; // Şu anki fare pozisyonu
        let deltaX = currentX - startX; // Hareket yönü ve mesafesi
        let slides = document.querySelectorAll('.product-card#productCard{{$product->id}} .product-images .swiper .swiper-wrapper .swiper-slide');
        let threshold = 100 / slides.length;

        if (deltaX > threshold) { // Sağ tarafa kaydırma
            product{{$product->id}}Swiper.slideNext();
            startX = currentX; // Yeni başlangıç pozisyonu
        } else if (deltaX < -threshold) { // Sol tarafa kaydırma
            product{{$product->id}}Swiper.slidePrev();
            startX = currentX; // Yeni başlangıç pozisyonu
        }
    });

    document.querySelector('.product-card#productCard{{$product->id}} .product-images .swiper').addEventListener('mouseleave', function() {
        product{{$product->id}}Swiper.slideTo(0);
    });

    document.querySelector('.product-card#productCard{{$product->id}} .product-images .swiper').addEventListener('mouseenter', function() {
        product{{$product->id}}Swiper.slideTo(0);
    });

    document.addEventListener('DOMContentLoaded', function(){
        document.querySelectorAll('.placeholder').forEach(placeHolder => {
            placeHolder.classList.remove('placeholder');
        });
    });

    const slideVideos = document.querySelectorAll('.swiper-slide video');

    if(slideVideos){
        slideVideos.forEach(slideVideo => {
            // Mouse üzerine geldiğinde video baştan başlasın ve oynasın
            slideVideo.addEventListener('mouseover', () => {
                slideVideo.currentTime = 0;  // Video baştan başlasın
                slideVideo.play();  // Video oynat
            });
            slideVideo.addEventListener('touchstart', () => {
                slideVideo.currentTime = 0;  // Video baştan başlasın
                slideVideo.play();  // Video oynat
            });

            // Mouse videonun üzerinden ayrıldığında video başa dönsün ve durdurulsun
            slideVideo.addEventListener('mouseout', () => {
                slideVideo.pause();  // Video durdur
                slideVideo.currentTime = 0;  // Video başa sar
            });
            slideVideo.addEventListener('touchend', () => {
                slideVideo.pause();  // Video durdur
                slideVideo.currentTime = 0;  // Video başa sar
            });
            slideVideo.addEventListener('touchcancel', () => {
                slideVideo.pause();  // Video durdur
                slideVideo.currentTime = 0;  // Video başa sar
            });
        });
    }



</script>