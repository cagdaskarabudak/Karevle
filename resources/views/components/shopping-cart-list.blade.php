<div class="row">
    @if(count($baskets) > 0)
    <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="card shopping-cart-total-card mb-3">
            <div class="card-body">
            </div>
            <div class="card-footer">
                <div class="total-price">
                    <span class="text">Toplam: </span>
                    <span class="value"> TL</span>
                </div>
                <a href=@if(count($baskets) > 0) "{{route('shopping-cart.confirm.view')}}" @else "Javascript:void(0);" @endif type="button" class="shopping-cart-submit-btn btn btn-success text-light">Sepeti Onayla</a>
                <a href="#" type="button" class="cancel-btn shopping-cart-clean">Sepeti Temizle</a>
            </div>
        </div>
        @if(Auth::check())
        <div class="card shopping-cart-coupon-card mb-3">
            <div class="card-body">
                <div class="input-group">
                    <input type="text" class="form-control coupon-code-input" name="coupon_code" id="coupon_code" placeholder="Kupon Kodu Gir" @if($baskets[0]->shopping_cart->coupon) disabled @endif>
                    <button type="button" class="btn btn-primary text-light coupon-code-add-btn" @if($baskets[0]->shopping_cart->coupon) disabled @endif>Ekle</button>
                </div>
                <span class="text-danger text-center w-100 d-block"></span>
            </div>
        </div>
        @else
        <div class="card shopping-cart-coupon-card mb-3">
            <div class="card-body">
                <span>Kupon kullanabilmek için <a href="{{ route('login.view') }}">giriş</a> yapmalısınız.</span>
            </div>
        </div>
        @endif
    </div>
    @endif
    <div class="col-md-12 col-sm-12 @if(count($baskets) == 0) col-lg-12 @else col-lg-9 @endif">
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