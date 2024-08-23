<x-page title="Sepetim">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="shopping-card-products-div">
                    <ul class="product-list info-list">
                        
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 shopping-card-success-div">
                <div class="total-count">@php $total_count = 0; @endphp <span>@foreach($baskets as $basket) @php $total_count += $basket->count @endphp @endforeach {{ $total_count }} </span> Ürün</div>
                <div class="total-price">@php $total_price = 0; @endphp Toplam: <span>@foreach($baskets as $basket) @php $total_price += $basket->count * $basket->product->price @endphp @endforeach {{ $total_price }}</span> TL</div>
                <div class="buttons">
                    <button class="shopping-card-success-btn">Sepeti Onayla</button>
                    <button class="shopping-card-destroy-btn">Sepeti Temizle</button>
                </div>
            </div>
        </div>
    </div>
    <script type="module">
        document.addEventListener('DOMContentLoaded', function(){
            shoppingCard.refreshPage();
        });

        document.querySelector('.shopping-card-destroy-btn').addEventListener('click', function(){
            shoppingCard.clear();
        });
    </script>
</x-page>