<div class="row">
    <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="card shopping-cart-total-card mb-3">
            <div class="card-body">
            </div>
            <div class="card-footer">
                <div class="total-price">
                    <span class="text">Toplam: </span>
                    <span class="value"> TL</span>
                </div>
                <a href=@if(count($baskets) > 0) "#" @else "Javascript:void(0);" @endif type="button" class="shopping-cart-submit-btn btn btn-success text-light">Sepeti Onayla</a>
                <a href="#" type="button" class="shopping-cart-clean">Sepeti Temizle</a>
            </div>
        </div>
        <div class="card shopping-cart-coupon-card mb-3">
            <div class="card-body">
                <div class="input-group">
                    <input type="text" class="form-control coupon-code-input" name="coupon_code" id="coupon_code" placeholder="Kupon Kodu Gir">
                    <a href="#" class="btn btn-primary text-light coupon-code-add-btn">Ekle</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-9 col-md-12 col-sm-12">
        <div class="card products-card shopping-cart-products-card products-card-danger">
            <div class="card-body empty">
                @foreach($baskets as $basket)
                    <x-shopping-cart-product-card :basket='$basket' />
                @endforeach
                <div class="message">
                    <span>Sepetiniz Boş! </span>
                    <a href="{{ route('home') }}" class="btn btn-success text-light"> <i class="fa-solid fa-cart-shopping"></i> Alışverişe başla</a></div>
            </div>
        </div>
    </div>
</div>

<script type="module">
shoppingCardTotalUpdate();
</script>