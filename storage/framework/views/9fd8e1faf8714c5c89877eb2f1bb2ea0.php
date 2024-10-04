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
                <form action="<?php echo e(route('shopping-cart.payment.transaction')); ?>" method="POST" class="form-cc">
                <button type="submit" class="shopping-cart-submit-btn btn btn-success text-light">Ödeme Yap</button>
                <a href="<?php echo e(route('shopping-cart.confirm.view')); ?>" type="button" class="cancel-btn">Adreslere Dön</a>
            </div>
        </div>
    </div>
    <div class="col-md-12 col-sm-12 col-lg-6">
        <div class="card">
            <div class="card-body">
                    <?php echo csrf_field(); ?>
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
        let formccdata = new FormData(formcc);
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
                    const shoppingcartdestroy = await axios.get('/shopping-cart/destroy');
                    if(shoppingcartdestroy.data.status == true){
                        Swal.fire({
                                title: 'Ödeme Başarılı!',
                                icon: 'success',
                                confirmButtonText: 'Devam et'
                            }).then(res => {
                                if(res.isConfirmed){
                                    <?php if(auth()->guard()->check()): ?>
                                        window.location.href = "/profilim/siparislerim?order_id="+response.data.order_id;
                                    <?php else: ?>
                                        window.location.href = "/?order_id="+response.data.order_id;
                                    <?php endif; ?>
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
                                    <?php if(auth()->guard()->check()): ?>
                                        window.location.href = "/profilim/siparislerim?order_id="+response.data.order_id;
                                    <?php else: ?>
                                        window.location.href = "/?order_id="+response.data.order_id;
                                    <?php endif; ?>
                                }
                            });
                    }
                }
                else if(e.data.status == 'fail'){
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
            const shoppingcartdestroy = await axios.get('/shopping-cart/destroy');
            if(shoppingcartdestroy.data.status == true){
                Swal.fire({
                        title: 'Ödeme Başarılı!',
                        icon: 'success',
                        confirmButtonText: 'Devam et'
                    }).then(res => {
                        if(res.isConfirmed){
                            <?php if(auth()->guard()->check()): ?>
                                window.location.href = "/profilim/siparislerim?order_id="+response.data.order_id;
                            <?php else: ?>
                                window.location.href = "/?order_id="+response.data.order_id;
                            <?php endif; ?>
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
                            <?php if(auth()->guard()->check()): ?>
                                window.location.href = "/profilim/siparislerim?order_id="+response.data.order_id;
                            <?php else: ?>
                                window.location.href = "/?order_id="+response.data.order_id;
                            <?php endif; ?>
                        }
                    });
            }

        }
    } catch (error) {
        throw error;
    }
});

</script><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/components/shopping-cart-payment.blade.php ENDPATH**/ ?>