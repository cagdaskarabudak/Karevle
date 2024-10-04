document.addEventListener('DOMContentLoaded', async function(){
    updateShoppingCartCount();
});

let shoppingCartCleanButton = document.querySelector('.shopping-cart-clean');

if(shoppingCartCleanButton){
    shoppingCartCleanButton.addEventListener('click', async function(){

        Swal.fire({
            title: 'Emin misiniz?',
            icon: 'warning',
            text: 'Sepeti temizlemek istediğinize emin misiniz?',
            confirmButtonText: 'Temizle',
            showCancelButton: true,
            cancelButtonText: 'Vazgeç',
        }).then(async function(response){
            if(response.isConfirmed){
                const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

                axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
            
                try {
                    const response = await axios.post('/cleanShoppingCart');
            
                    if(response.data == true){
                        let productCards = document.querySelectorAll('.product-card');
                        if(productCards){
                            productCards.forEach(productCard => {
                                productCard.remove();
                            });
                        }
                        updateShoppingCartCount();
                        shoppingCardTotalUpdate();
                        let totalcard = document.querySelector('.shopping-cart-total-card').parentElement;
                        let productscard = document.querySelector('.products-card').parentElement;
                        if(totalcard){
                            totalcard.remove();
                        }
                        if(productscard){
                            productscard.classList.remove('col-lg-9');
                            productscard.classList.add('col-lg-12');
                        }
                    }
                } catch (error) {
                    console.error('Error:', error);
                    throw error;
                }
            }
        });

    });
}

let shoppingCardButtons = document.querySelectorAll('.shopping-card-btn');

if(shoppingCardButtons){
    shoppingCardButtons.forEach(shoppingCardButton => {
        shoppingCardButton.addEventListener('click', async function(){
            let productid = shoppingCardButton.getAttribute('data-id');

            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        
            try {
                const response = await axios.post('/addShoppingCart', {
                    productid: productid
                });
        
                if(response.data == true){
                    shoppingCardButton.querySelector('span').innerHTML= 'Eklendi!';
                    shoppingCardButton.classList.add('text-light');
                    shoppingCardButton.classList.add('bg-success');
                    shoppingCardButton.classList.add('border-success');
                    shoppingCardButton.querySelector('svg').setAttribute('data-icon', 'cart-circle-check');
                    setTimeout(function(){
                        shoppingCardButton.querySelector('span').innerHTML= 'Sepete Ekle';
                        shoppingCardButton.classList.remove('text-light');
                        shoppingCardButton.classList.remove('bg-success');
                        shoppingCardButton.classList.remove('border-success');
                    }, 500);
                    updateShoppingCartCount();
                }
            } catch (error) {
                console.error('Error:', error);
                throw error;
            }
        });
    });
}

let productShoppingCartPlusButtons = document.querySelectorAll('.shopping-card-plus-btn');

if(productShoppingCartPlusButtons){
    productShoppingCartPlusButtons.forEach(productShoppingCartPlusButton => {
        productShoppingCartPlusButton.addEventListener('click', async function(){
            let productid = productShoppingCartPlusButton.getAttribute('data-id');
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        
            try {
                const response = await axios.post('/addShoppingCart', {
                    productid: productid
                });
        
                if(response.data == true){
                    console.log(true);
                    let productCountDom = productShoppingCartPlusButton.parentElement.parentElement.querySelector('.product-info .count span');
                    let currentProductCount = Number(productCountDom.innerHTML);
                    productCountDom.innerHTML = currentProductCount+1;

                    updateShoppingCartCount();
                    shoppingCardTotalUpdate();
                }
            } catch (error) {
                console.error('Error:', error);
                throw error;
            }
        });
    });
}

let productShoppingCartMinusButtons = document.querySelectorAll('.shopping-card-minus-btn');

if(productShoppingCartMinusButtons){
    productShoppingCartMinusButtons.forEach(productShoppingCartMinusButton => {
        productShoppingCartMinusButton.addEventListener('click', async function(){
            let productid = productShoppingCartMinusButton.getAttribute('data-id');
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        
            try {
                const response = await axios.post('/removeShoppingCart', {
                    productid: productid
                });
        
                if(response.data == true){
                    console.log(true);
                    let productCountDom = productShoppingCartMinusButton.parentElement.parentElement.querySelector('.product-info .count span');
                    let currentProductCount = Number(productCountDom.innerHTML);
                    if(currentProductCount == 1){
                        productShoppingCartMinusButton.parentElement.parentElement.remove();
                    }
                    else{
                        productCountDom.innerHTML = currentProductCount-1;
                    }

                    updateShoppingCartCount();
                    shoppingCardTotalUpdate();
                }
            } catch (error) {
                console.error('Error:', error);
                throw error;
            }
        });
    });
}

async function updateShoppingCartCount(){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/countShoppingCart');

        let shoppingCartCountBadges = document.querySelectorAll('.shopping-cart-count-badge');
        shoppingCartCountBadges.forEach(shoppingCartCountBadge => {
            if(response.data != 0){
                shoppingCartCountBadge.innerHTML = response.data;                
                let shoppingCartProductsCard = document.querySelector('.shopping-cart-products-card');
                if(shoppingCartProductsCard){
                    shoppingCartProductsCard.querySelector('.card-body').classList.remove('empty');
                }
            }
            else{
                shoppingCartCountBadge.innerHTML = '';
                let shoppingCartProductsCard = document.querySelector('.shopping-cart-products-card');
                if(shoppingCartProductsCard){
                    shoppingCartProductsCard.querySelector('.card-body').classList.add('empty');
                }
            }
        });

    } catch (error) {
        console.error('Error:', error);
        throw error;
    }
}

let CouponCodeBtn = document.querySelector('.coupon-code-add-btn');
if(CouponCodeBtn){
    CouponCodeBtn.addEventListener('click', async function(){
        const details = await axios.post('/details-shopping-cart');
        if(!details.data.coupon){
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        
            try {
                const response = await axios.post('/checkCoupon', {
                    coupon_code: document.querySelector('.coupon-code-input').value
                });
    
                if(response.data.status == true){
                    shoppingCardTotalUpdate();
                    let couponcodeinput = document.querySelector('.coupon-code-input');
                    let couponcodespan = document.querySelector('.shopping-cart-coupon-card .card-body span');
                    couponcodespan.innerHTML = "";
                    couponcodeinput.disabled = true;
                    CouponCodeBtn.disabled = true;
                }
                else{
                    couponError(response.data.message);
                }
                
        
            } catch (error) {
                console.error('Error:', error);
                throw error;
            }
        }
        else{
            console.log('error');
        }

    });
}

function number_format(number){
    return number.toLocaleString('tr-TR', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

window.calc_total = async function(baskets, vat_total, cargo, coupon, discounts_total){
    let totalCard = document.querySelector('.shopping-cart-total-card .card-body');
    if(totalCard){
        totalCard.innerHTML = "";
    }
    if(baskets){
    
    //Baskets
    let basketsTotalPrice = 0;
    let dataproduct = document.createElement('div');
    dataproduct.classList.add('data');
    dataproduct.classList.add('product');
    baskets.forEach(basket => {
        basketsTotalPrice += basket.count * basket.product.calc_vatless_price;
    });
    dataproduct.innerHTML = `
        <span class="data-name">Ürünler Toplamı</span>
        <span class="data-value">${number_format(basketsTotalPrice)} TL</span>
    `;
    $(totalCard).append(dataproduct);
    
    

    //VAT
    let datatax = document.createElement('div');
    datatax.classList.add('data');
    datatax.classList.add('tax');
    datatax.innerHTML = `
        <span class="data-name">KDV Toplamı</span>
        <span class="data-value">${number_format(vat_total)} TL</span>
    `;
    $(totalCard).append(datatax);


    //Cargo
    let totalCargoPrice = 0;
    if(cargo.price > 0){
        let datacargo = document.createElement('div');
        datacargo.classList.add('data');
        datacargo.classList.add('cargo');
    
        datacargo.innerHTML = `
            <span class="data-name">Kargo</span>
            <span class="data-value">${number_format(cargo.price)} TL</span>
        `;
    
        totalCargoPrice = Number(cargo.price);
    
        $(totalCard).append(datacargo);
    }
    

    //Discount
    if(discounts_total > 0){
        let datadiscount = document.createElement('div');
        datadiscount.classList.add('data');
        datadiscount.classList.add('discount');
    
        datadiscount.innerHTML = `
            <span class="data-name">Toplam Kazanç</span>
            <span class="data-value text-success">-${number_format(discounts_total)} TL</span>
        `;
    
        if(discounts_total > 0){
            $(totalCard).append(datadiscount);
        }
    }

    //Coupon
    if(coupon){
        let datadiscount = document.createElement('div');
        datadiscount.classList.add('data');
        datadiscount.classList.add('discount');
    
        datadiscount.innerHTML = `
            <span class="data-name">Kupon (${coupon.code})</span>
            <span class="data-value text-success">-${number_format(coupon.coupon_amount)} TL</span>
            <button class="btn btn-danger coupon-cancel-btn" onClick="discountCancel(${coupon.id})"><i class="fa-solid fa-trash"></i> Kuponu kaldır</button> 
        `;
    
        $(totalCard).append(datadiscount);
    }


    let totalPrice = basketsTotalPrice - discounts_total + vat_total + totalCargoPrice - (coupon ? coupon.coupon_amount : 0);

    let totalDiv = document.querySelector('.shopping-cart-total-card .card-footer .total-price .value');

    totalDiv.innerHTML = number_format(totalPrice) + " TL";
    }
    else
    {
        let totalPrice = 0;

        let totalDiv = document.querySelector('.shopping-cart-total-card .card-footer .total-price .value');
    
        if(totalDiv){
            totalDiv.innerHTML = number_format(totalPrice) + " TL";
        }
    }
};

window.shoppingCardTotalUpdate = async function(){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/details-shopping-cart');
        calc_total(response.data.baskets, response.data.vat_total, response.data.cargo, response.data.coupon, response.data.discounts_total);
    } catch (error) {
        throw error;
    }
}

window.couponError = async function(message){
    let span = document.querySelector('.shopping-cart-coupon-card .card-body span');
    span.innerHTML = message;
}

window.discountCancel = async function(discount_id){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/coupon-cancel', {
            coupon_id: discount_id
        });
        if(response.data == true){
            shoppingCardTotalUpdate();
            let input = document.querySelector('.coupon-code-input');
            let button = document.querySelector('.coupon-code-add-btn');
            input.disabled = false;
            button.disabled = false;
            input.value = "";
        }
        else{
            console.log(response);
        }
    } catch (error) {
        throw error;
    }
}