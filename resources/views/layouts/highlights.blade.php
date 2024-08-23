    <div class="swiper-card swiper-{{ $list->color }}" id="{{ $list->slug }}">
        <div class="swiper highlight-swiper">
            <h1 class="swiper-title"><i class="fa-duotone {{ $list->icon }} fa-beat-fade fa-2xl" style="--fa-animation-duration: 3s;"></i>{{ $list->name }} <a href="{{ route('list.show', $list->slug) }}">Tümünü Gör <i class="fa-thin fa-chevron-right fa-xs"></i></a></h1>
            <div class="swiper-wrapper">
                @foreach($list->products as $product) 
                <div class="swiper-slide highlight-product">
                    @if(Auth::check()) <button class="favorite-btn  @if($product->isFavoritedUser(Auth::user()->id)) favorite @endif " product-id="{{ $product->id }}"><i class="@if($product->isFavoritedUser(Auth::user()->id)) fa-solid @else fa-thin @endif fa-heart"></i></button> @endif
                    <div class="p-list">
                        @foreach($product->lists as $plist)
                            <span class="p-list-{{ $plist->color }}"><i class="fa-thin {{ $plist->icon }}"></i> {{ $plist->short_name }}</span>
                        @endforeach
                    </div>
                    <img src="{{ '/storage/product_images/'.$product->images->first()->name }}" alt="Highlight Product">
                    <div class="info">
                        <h1>{{ $product->name }}</h1>
                        <div class="rating"><span class="rate-amount">{{ $product->rate() }}</span><div class="product-rateyo"></div><span class="rate-count">({{ count($product->comments) }})</span></div>
                        @if($product->new_price() != 0)
                        <h5>{{ $product->price }} TL</h5>
                        <h2>{{ $product->new_price() }} TL</h2>
                        @else
                        <h2>{{ $product->price }} TL</h2>
                        @endif
                    </div>
                    <button class="add-to-card" onclick="shoppingCard.add({{ $product->id }})">Sepete Ekle</button>
                    <a type="button" class="view-product" href="{{ route('product.show', $product->slug) }}">İncele</a>
                </div>
                @endforeach
            </div>
        </div>
        <button class="swiper-nav-btn next"><i class="fa-solid fa-chevron-right"></i></button>
        <button class="swiper-nav-btn prev"><i class="fa-solid fa-chevron-left"></i></button>
    </div>

  <script type="module">
    let swiper{{ $list->id }} = new Swiper('.swiper-card#{{ $list->slug }} .swiper', {
        loop: false,
        slidesPerView: "auto",
        spaceBetween: 20,
        mousewheel: false,
        autoplay: true,
        navigation: {
            nextEl: '.swiper-card#{{ $list->slug }} .swiper-nav-btn.next',
            prevEl: '.swiper-card#{{ $list->slug }} .swiper-nav-btn.prev'
        }
    });

    let rates = document.querySelectorAll('.rating');

    rates.forEach(rateDom => {
            let rateAmount = Number(rateDom.querySelector('.rate-amount').innerHTML);
            let rateStars = rateDom.querySelector('.product-rateyo');
            $(rateStars).rateYo({
                rating: rateAmount,
                numStars: 5,
                minValue: 0,
                maxValue: 5,
                starWidth: '12px',
                readOnly: true
            });
    });


  </script>