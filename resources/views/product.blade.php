<x-page title="{{ $product->name }} Fiyatı, Yorumları">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a class="text-secondary text-decoration-none" href="{{ route('home') }}">Karevle</a></li>
                @foreach($product->category->getTopMostCategory(true) as $topCategory)
                    @if ($loop->last)
                        <li class="breadcrumb-item active"><a class="text-primary text-decoration-none" href="{{ route('category.view', $topCategory->slug) }}">{{ $topCategory->name }}</a></li>
                    @else
                        <li class="breadcrumb-item"><a class="text-secondary text-decoration-none" href="{{ route('category.view', $topCategory->slug) }}">{{ $topCategory->name }}</a></li>
                    @endif
                @endforeach
            </ol>
          </nav>
        <div class="row">
            <div class="col-lg-4">
                <div class="swiper product-images">
                    <div class="swiper-wrapper">
                        @foreach($product->images as $image)
                        <div class="swiper-slide">
                            <img class="zoomist-wrapper zoomist-image" src="{{ '/storage/product_images/'.$image->name }} ">
                        </div>
                        @endforeach
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                
            </div>
            <div class="col-lg-8">
                <div class="card product-card">
                    <div class="card-body">
                        <div class="product-lists">
                            @foreach($product->lists as $list)
                            <a href="/list/{{ $list->slug }}" class="badge text-bg-{{ $list->color }} text-light rounded-pill text-decoration-none"><i class="fa-solid {{ $list->icon }}"></i> {{ $list->name }}</a>
                            @endforeach
                        </div>
                        <div class="product-name">{{ $product->name }}</div>
                        <div class="product-rate">{{ $product->rate() }} <div class="product-rate-stars"></div><div class="product-rate-count">({{ count($product->comments) }})</div></div>
                        @if($product->new_price() != 0)
                            <div class="product-old-price">{{ $product->price }} TL</div>
                            <div class="product-price">{{ $product->new_price() }} TL</div>
                        @else
                            <div class="product-price">{{ $product->price }} TL</div>
                        @endif
                        <div class="product-content">
                            {{ $product->content->content }}
                        </div>
                        <div class="zoomed-image"></div>
                    </div>
                </div>
                <div class="buttons">
                    <button class="add-to-card product-page" onclick="shoppingCard.add({{ $product->id }})" product-id="{{ $product->id }}">
                        <i class="fa-solid fa-cart-shopping"></i> Sepete Ekle
                    </button>
                    @if(Auth::check())
                    <button class="favorite-btn product-page @if($product->isFavoritedUser(Auth::user()->id)) favorite @endif" product-id="{{ $product->id }}">
                        <i class="@if($product->isFavoritedUser(Auth::user()->id)) fa-solid @else fa-thin @endif fa-heart"></i>
                    </button>
                    @endif
                </div>
            </div>
        </div>
        @if($product->comments)
        <div class="row my-5">
            <h5>Ürün Değerlendirmeleri</h5>
            <div class="comments">
                @foreach($product->comments as $comment)
                <div class="comment-card">
                        <div class="comment">
                            <div class="comment-info d-flex justify-content-between">
                                <div class="comment-user">
                                    {{ $comment->user->first_name.' '.$comment->user->last_name }}
                                </div>
                                <div class="comment-date">
                                    {{ \Carbon\Carbon::parse($comment->created_at)->locale('tr')->translatedFormat('d M Y') }}
                                </div>
                            </div>
                            <div class="comment-rate"><span>{{ $comment->rate }}</span><div class="comment-rate-stars"></div></div>
                            <div class="comment-content">
                                {{ $comment->comment }}
                            </div>
                            <div class="comment-images">
                                @foreach($comment->images as $image)
                                <img src="{{ '/storage/comment_images/'.$image->name }}" alt="">
                                @endforeach
                            </div>
                        </div>
                </div>
                @endforeach
            </div>
        </div>
        @endif
    </div>
<script type="module">
    let productImagesSwiper = new Swiper('.product-images', {
        loop: true,
        slidesPerView: 1,
        spaceBetween: 30,
        mousewheel: true,
        pagination: {
            el: '.swiper-pagination'
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        }
    });

    $('.product-rate-stars').rateYo({
        rating: {{ $product->rate() }},
        numStars: 5,
        minValue: 0,
        maxValue: 5,
        starWidth: '20px',
        readOnly: true
    });

    document.addEventListener('DOMContentLoaded', function(){
        let commentRates = document.querySelectorAll('.comment-rate');
        commentRates.forEach(commentRate => {
            let rate = Number(commentRate.querySelector('span').innerHTML);
            let starsDiv = commentRate.querySelector('.comment-rate-stars');
            $(starsDiv).rateYo({
                rating: rate,
                numStars: 5,
                minValue: 0,
                maxValue: 5,
                starWidth: '15px',
                readOnly: true
            });
        });
    });

    let productImageDoms = document.querySelectorAll('.swiper-slide');

    productImageDoms.forEach(productImageDom => {
        new Zoomist(productImageDom, {
            maxScale: 4,
            bounds: true,
            slider: true,
            zoomer: true
        })
    });
</script>
</x-page>