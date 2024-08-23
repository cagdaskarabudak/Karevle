<x-page title="{{ $list->name }}">
    <div class="container">
          <div class="row">
            <div class="col-lg-12">
                <div class="sort-filter">
                    <div class="page-info">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a class="text-secondary text-decoration-none" href="{{ route('home') }}">Karevle</a></li>
                                <li class="breadcrumb-item active"><a class="text-{{ $list->color }} text-decoration-none" href="{{ route('home') }}"><i class="fa-solid {{ $list->icon }}"></i> {{ $list->name }}</a></li>
                            </ol>
                        </nav>
                        <span>{{ count($list->products) }} ürün listeleniyor.</span>
                    </div>
                    <div class="filter">
                        <div class="filter-icon">
                            <i class="fa-solid fa-filter"></i>
                        </div>
                        <select name="sort_filter" id="sort_filter">
                            <option value="normal">Gelişmiş Sıralama</option>
                            <option value="price_to_up">Fiyat Artan</option>
                            <option value="price_to_down">Fiyat Azalan</option>
                            <option value="top_new">En Yeni</option>
                            <option value="top_old">En Eski</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="filter-card">
                    <div class="my-3">
                        <label for="text_search" class="form-label text-dark"><i class="fa-solid fa-search"></i> Kelime ile arama</label>
                        <input type="text" class="form-control text-search" id="text_search">
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="list-card">
                    <ul class="list-products {{ $list->color }}-list">
                        @foreach ($list->products as $product)
                        <li class="list-product" keys="@foreach($product->getKeys() as $key){{ $key }} @endforeach" date="{{ strtotime($product->created_at) }}" price="{{ $product->price }}">
                            @if(Auth::check())
                            <button class="favorite-btn @if($product->isFavoritedUser(Auth::user()->id)) favorite @endif" product-id="{{ $product->id }}">
                                <i class="@if($product->isFavoritedUser(Auth::user()->id)) fa-solid @else fa-thin @endif fa-heart"></i>
                            </button>
                            @endif
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
                            <button class="add-to-card"  onclick="shoppingCard.add({{ $product->id }})">Sepete Ekle</button>
                            <a type="button" class="view-product" href="{{ route('product.show', $product->slug) }}">İncele</a>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>
          </div>
    </div>
    <script type="module">
        document.addEventListener('DOMContentLoaded', function(){

            let productRatings = document.querySelectorAll('.rating');
            productRatings.forEach(productRating => {
                let rate = Number(productRating.querySelector('span.rate-amount').innerHTML);
                let rateArea = productRating.querySelector('.product-rateyo');
                console.log(rate);
                $(rateArea).rateYo({
                rating: rate,
                numStars: 5,
                minValue: 0,
                maxValue: 5,
                starWidth: '15px',
                readOnly: true
            });
            });

            document.querySelector('.text-search#text_search').addEventListener('keyup', function(){
                filter.search(this.value);
            });

            document.querySelector('#sort_filter').addEventListener('change', function(){
                filter.sort(this.value);
            });
        });

    </script>
</x-page>