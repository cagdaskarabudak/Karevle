<x-page title="Favorites">
        <div class="container">
              <div class="row">
                <div class="col-lg-12">
                    <div class="sort-filter">
                        <div class="page-info">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a class="text-secondary text-decoration-none" href="{{ route('home') }}">Karevle</a></li>
                                    <li class="breadcrumb-item active"><a class="text-danger text-decoration-none" href="{{ route('home') }}"><i class="fa-solid fa-heart"></i> Favoriler</a></li>
                                </ol>
                            </nav>
                            <span>{{ count($favorites) }} ürün listeleniyor.</span>
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
                        <ul class="list-products danger-list">
                            @foreach ($favorites as $favorite)
                            <li class="list-product" keys="@foreach($favorite->product->getKeys() as $key){{ $key }} @endforeach" date="{{ strtotime($favorite->product->created_at) }}" price="{{ $favorite->product->price }}">
                                @if(Auth::check())
                                <button class="favorite-btn @if($favorite->product->isFavoritedUser(Auth::user()->id)) favorite @endif" product-id="{{ $favorite->product->id }}">
                                    <i class="@if($favorite->product->isFavoritedUser(Auth::user()->id)) fa-solid @else fa-thin @endif fa-heart"></i>
                                </button>
                                @endif
                                <div class="p-list">
                                    @foreach($favorite->product->lists as $plist)
                                        <span class="p-list-{{ $plist->color }}"><i class="fa-thin {{ $plist->icon }}"></i> {{ $plist->short_name }}</span>
                                    @endforeach
                                </div>
                                <img src="{{ '/storage/product_images/'.$favorite->product->images->first()->name }}" alt="Highlight Product">
                                <div class="info">
                                    <h1>{{ $favorite->product->name }}</h1>
                                    <div class="rating"><span class="rate-amount">{{ $favorite->product->rate() }}</span><div class="product-rateyo"></div><span class="rate-count">({{ count($favorite->product->comments) }})</span></div>
                                    @if($favorite->product->new_price() != 0)
                                    <h5>{{ $favorite->product->price }} TL</h5>
                                    <h2>{{ $favorite->product->new_price() }} TL</h2>
                                    @else
                                    <h2>{{ $favorite->product->price }} TL</h2>
                                    @endif
                                </div>
                                <button class="add-to-card"  onclick="shoppingCard.add({{ $favorite->product->id }})">Sepete Ekle</button>
                                <a type="button" class="view-product" href="{{ route('product.show', $favorite->product->slug) }}">İncele</a>
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