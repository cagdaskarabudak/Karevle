<x-page title="Kuponlarım">
    <x-account>
        <div class="tab-navigation d-flex justify-content-center">
            <button class="coupons-tab-btn btn btn-primary text-light me-2" target=".defined-coupons">Tanımlanmış Kuponlar</button>
            <button class="coupons-tab-btn btn btn-secondary text-light me-2" target=".used-coupons">Kullanılmış Kuponlar</button>
            <button class="coupons-tab-btn btn btn-secondary text-light" target=".useable-coupons">Kullanılabilir Kuponlar</button>
        </div>
        <div class="coupons-tab defined-coupons" style="display: block;">
            @foreach(Auth::user()->coupons as $user_coupon)
                <div class="coupon">
                    <div class="header">
                        <div class="name @if($user_coupon->user_is_used) text-danger @else text-success @endif"><i class="fa-solid fa-ticket"></i> {{ $user_coupon->coupon->name }}</div>
                        <div class="code">KOD: <span>{{ $user_coupon->coupon->code }}</span></div>
                    </div>
                    <div class="content">{{ $user_coupon->coupon->content }}</div>
                    <div class="footer">
                        <div class="use-info">KALAN KULLANIM HAKKI: {{ $user_coupon->coupon->user_use_limit - $user_coupon->is_used }}</div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="coupons-tab used-coupons" style="display: none;">
            @foreach(Auth::user()->coupons as $user_coupon)
                @if($user_coupon->is_used == $user_coupon->coupon->user_use_limit)
                    <div class="coupon">
                        <div class="header">
                            <div class="name @if($user_coupon->user_is_used) text-danger @else text-success @endif"><i class="fa-solid fa-ticket"></i> {{ $user_coupon->coupon->name }}</div>
                            <div class="code">KOD: <span>{{ $user_coupon->coupon->code }}</span></div>
                        </div>
                        <div class="content">{{ $user_coupon->coupon->content }}</div>
                        <div class="footer">
                            <div class="use-info">KALAN KULLANIM HAKKI: {{ $user_coupon->coupon->user_use_limit - $user_coupon->is_used }}</div>
                        </div>
                    </div>
                @endif
            @endforeach
        </div>
        <div class="coupons-tab useable-coupons" style="display: none;">
            @foreach(Auth::user()->coupons as $user_coupon)
                @if($user_coupon->is_used < $user_coupon->coupon->user_use_limit)
                    <div class="coupon">
                        <div class="header">
                            <div class="name @if($user_coupon->user_is_used) text-danger @else text-success @endif"><i class="fa-solid fa-ticket"></i> {{ $user_coupon->coupon->name }}</div>
                            <div class="code">KOD: <span>{{ $user_coupon->coupon->code }}</span></div>
                        </div>
                        <div class="content">{{ $user_coupon->coupon->content }}</div>
                        <div class="footer">
                            <div class="use-info">KALAN KULLANIM HAKKI: {{ $user_coupon->coupon->user_use_limit - $user_coupon->is_used }}</div>
                        </div>
                    </div>
                @endif
            @endforeach
        </div>
        <div class="coupon-query border-top p-3 mt-3">
            <h6 class="mb-2">Kupon Sorgula</h6>
            <div class="input-group">
                <input class="form-control coupon-query-input" type="text" placeholder="Kupon kodu giriniz.">
                <button class="btn btn-success text-light coupon-query-btn">Sorgula</button>
            </div>
            <div class="query-results">

            </div>
        </div>
        <script type="module">
            let couponTabButtons = document.querySelectorAll('.coupons-tab-btn');
            if(couponTabButtons){
                couponTabButtons.forEach(couponTabButton => {
                    couponTabButton.addEventListener('click', async function(){
                        let targetDom = document.querySelector(couponTabButton.getAttribute('target'));
                        let otherDoms = document.querySelectorAll('.coupons-tab');
                        $(otherDoms).hide();
                        $(targetDom).show();
                        let activeCouponTabBtn = document.querySelector('.coupons-tab-btn.btn-primary');
                        activeCouponTabBtn.classList.remove('btn-primary');
                        activeCouponTabBtn.classList.add('btn-secondary');
                        couponTabButton.classList.remove('btn-secondary');
                        couponTabButton.classList.add('btn-primary');
                    });
                });
            }

            let couponquerybtn = document.querySelector('.coupon-query-btn');
            if(couponquerybtn){
                couponquerybtn.addEventListener('click', async function(){
                    let couponqueryinput = document.querySelector('.coupon-query-input');
                    if(couponqueryinput && couponqueryinput.value.length > 0){
                        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
                        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
                        try {
                            const response = await axios.post('/coupon-query', {
                                code: couponqueryinput.value
                            });
                            if(response.data.status == true){
                                let queryresults = document.querySelector('.query-results');
                                queryresults.innerHTML = `
                                    <div class="coupon">
                                        <div class="header">
                                            <div class="name ${response.data.coupon_user.user_is_used ? 'text-danger' : 'text-success'}"><i class="fa-solid fa-ticket"></i> ${response.data.coupon_user.coupon.name}</div>
                                            <div class="code">KOD: <span>${response.data.coupon_user.coupon.code}</span></div>
                                        </div>
                                        <div class="content">${response.data.coupon_user.coupon.content}</div>
                                        <div class="footer">
                                            <div class="use-info">KALAN KULLANIM HAKKI: ${response.data.coupon_user.coupon.user_use_limit - response.data.coupon_user.is_used}</div>
                                        </div>
                                    </div>
                                `;
                            }
                            else{
                                let queryresults = document.querySelector('.query-results');
                                queryresults.innerHTML = response.data.message;
                            }
                        } catch (error) {
                            throw error;
                        }
                    }
                });
            }
            
        </script>
    </x-account>
</x-page>
