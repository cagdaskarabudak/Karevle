<div class="row justify-content-center">
    <div class="col-lg-3 col-md-12 col-sm-12">
        <div class="card shopping-cart-total-card mb-3">
            <div class="card-body">
            </div>
            <div class="card-footer">
                <div class="total-price">
                    <span class="text">Toplam: </span>
                    <span class="value"> TL</span>
                </div>
                <form action="{{ route('shopping-cart.payment.transaction') }}" method="POST" class="form-cc">
                <button type="submit" class="shopping-cart-submit-btn btn btn-success text-light">Ödeme Yap</button>
                <a href="{{ route('shopping-cart.confirm.view') }}" type="button" class="cancel-btn">Adreslere Dön</a>
            </div>
        </div>
    </div>
    <div class="col-md-12 col-sm-12 col-lg-6">
        <div class="card">
            <div class="card-body">
                    @csrf
                    <div class="mb-3">
                        <label for="cc_user" class="form-label">Kart Üzerindeki İsim</label>
                        <input class="form-control" type="text" name="cc_user" id="cc_user" placeholder="John Doe" value="John Doe">
                    </div>
                    
                    <div class="mb-3">
                        <label for="cc_no">Kart Numarası</label>
                        <input class="form-control" type="text" name="cc_no" max="16" min="16" id="cc_no" placeholder="0000 0000 0000 0000" value="5528790000000008">
                    </div>
                    
                    <div class="mb-3">
                        <label for="cc_month">Kart Son Kullanım Tarihi AA/YYYY</label>
                        <div class="input-group">
                            <input class="form-control" type="text" name="cc_month" max="2" min="2" placeholder="AA" value="12">
                            <input class="form-control" type="text" name="cc_year" max="4" min="4" placeholder="AA" value="2030">
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="cc_cvv">Kart Güvenlik Numarası</label>
                        <input class="form-control" type="text" name="cc_cvv" max="3" min="3" placeholder="000" value="123">
                    </div>
                    
                    <div class="form-check mb-3">
                        <input class="form-check-input threeds-check-input" type="checkbox" name="threeds" id="threeds" checked>
                        <label class="form-check-label" for="threeds">3D Secure ile Ödeme Yapmak İstiyorum</label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="threeds">
</div>

<script type="module">
shoppingCardTotalUpdate();

let formcc = document.querySelector('.form-cc');
formcc.addEventListener('submit', async function(e){
    let threedsCheck = document.querySelector('input.threeds-check-input');

    e.preventDefault();
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const orderTransaction = await axios.get('/order/create');
        if(orderTransaction.data.status == true){
            const orderPaymentPendingStatusTransaction = await axios.post('/order/status_update', {
                                'status_id': 2,
                                'order_id': orderTransaction.data.order.id
                            });
            let formccdata = new FormData(formcc);
            formccdata.append('order_id', orderTransaction.data.order.id);
            const response = await axios.post('/sepetim/odeme', formccdata, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                }
            });
            if(response.data.status == 'page'){
                let threeds = document.querySelector('.threeds');
                threeds.classList.add('show');
                let iframe = document.createElement('iframe');
                threeds.append(iframe);
                iframe.srcdoc = response.data.html;

                window.addEventListener('message', async function(e){
                    if(e.data.status == 'success'){
                        threeds.classList.remove('show');
                        iframe.remove();
                        const orderStatusTransaction = await axios.post('/order/status_update', {
                                'status_id': 3,
                                'order_id': orderTransaction.data.order.id
                            });
                        const shoppingcartdestroy = await axios.get('/shopping-cart/destroy');
                        if(shoppingcartdestroy.data.status == true){
                            Swal.fire({
                                    title: 'Ödeme Başarılı!',
                                    icon: 'success',
                                    confirmButtonText: 'Devam et'
                                }).then(res => {
                                    if(res.isConfirmed){
                                        @auth
                                            window.location.href = "/profilim/siparislerim?order_id="+orderTransaction.data.order.id;
                                        @else
                                            window.location.href = "/?order_id="+orderTransaction.data.order.id;
                                        @endauth
                                    }
                                });
                        }
                        else{
                            Swal.fire({
                                    title: 'Ödeme Başarılı!',
                                    icon: 'success',
                                    confirmButtonText: 'Devam et',
                                    text: 'Ödeme başarıyla alındı fakat sepet temizlenmedi! => '+shoppingcartdestroy.data.message
                                }).then(res => {
                                    if(res.isConfirmed){
                                        @auth
                                            window.location.href = "/profilim/siparislerim?order_id="+orderTransaction.data.order.id;
                                        @else
                                            window.location.href = "/?order_id="+orderTransaction.data.order.id;
                                        @endauth
                                    }
                                });
                        }
                    }
                    else if(e.data.status == 'fail'){
                        const orderStatusTransaction = await axios.post('/order/status_update', {
                                'status_id': 11,
                                'order_id': orderTransaction.data.order.id
                            });
                        threeds.classList.remove('show');
                        iframe.remove();
                        Swal.fire({
                            title: e.data.error_code,
                            icon: 'error',
                            text: e.data.error_message,
                            confirmButtonText: 'Kapat'
                        }).then(response => {
                            if(response.isConfirmed){
                                window.location.reload();
                            }
                        });
                    }
                });
                
            }
            else if(response.data.status == 'fail'){
                const orderStatusTransaction = await axios.post('/order/status_update', {
                                'status_id': 11,
                                'order_id': orderTransaction.data.order.id
                            });
                Swal.fire({
                            title: response.data.error_code,
                            icon: 'error',
                            text: response.data.error_message,
                            confirmButtonText: 'Kapat'
                        }).then(res => {
                            if(res.isConfirmed){
                                window.location.reload();
                            }
                        });
            }
            else if(response.data.status == 'success'){
                const orderStatusTransaction = await axios.post('/order/status_update', {
                                'status_id': 3,
                                'order_id': orderTransaction.data.order.id
                            });
                const shoppingcartdestroy = await axios.get('/shopping-cart/destroy');
                if(shoppingcartdestroy.data.status == true){
                    Swal.fire({
                            title: 'Ödeme Başarılı!',
                            icon: 'success',
                            confirmButtonText: 'Devam et'
                        }).then(res => {
                            if(res.isConfirmed){
                                @auth
                                    window.location.href = "/profilim/siparislerim?order_id="+orderTransaction.data.order.id;
                                @else
                                    window.location.href = "/?order_id="+orderTransaction.data.order.id;
                                @endauth
                            }
                        });
                }
                else{
                    Swal.fire({
                            title: 'Ödeme Başarılı!',
                            icon: 'success',
                            confirmButtonText: 'Devam et',
                            text: 'Ödeme başarıyla alındı fakat sepet temizlenmedi! => '+shoppingcartdestroy.data.message
                        }).then(res => {
                            if(res.isConfirmed){
                                @auth
                                    window.location.href = "/profilim/siparislerim?order_id="+orderTransaction.data.order.id;
                                @else
                                    window.location.href = "/?order_id="+orderTransaction.data.order.id;
                                @endauth
                            }
                        });
                }

            }
        }
        else{
            Swal.fire({
                title: 'Hata!',
                text: 'Sipariş oluşturulamadı! '+orderTransaction.data.message + '('+orderTransaction.data.line+')',
                icon: 'error',
                confirmButtonText: 'Kapat'
            });
        }

    } catch (error) {
        throw error;
    }
});

</script>