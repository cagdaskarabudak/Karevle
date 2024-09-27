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

    calc_total
}

let CouponCodeBtn = document.querySelector('.coupon-code-add-btn');
if(CouponCodeBtn){
    CouponCodeBtn.addEventListener('click', async function(){
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
    
        try {
            const response = await axios.post('/checkCoupon', {
                coupon_code: document.querySelector('.coupon-code-input').value
            });

            let offersData = document.querySelector('.data.offers');
            offersData.querySelector('.data-name').innerHTML = `İndirim (${response.data.name})`;
            offersData.querySelector('.data-value').innerHTML = `-(${number_format(Number(response.data.coupon_amount))})`;
            
    
        } catch (error) {
            console.error('Error:', error);
            throw error;
        }
    });
}

function number_format(number){
    return number.toLocaleString('tr-TR', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

window.calc_total = async function(baskets, taxes, cargo, discounts){
    let totalCard = document.querySelector('.shopping-cart-total-card .card-body');
    totalCard.innerHTML = "";
    if(baskets.length > 0){
    
    //Baskets
    let basketsTotalPrice = 0;
    let dataproduct = document.createElement('div');
    dataproduct.classList.add('data');
    dataproduct.classList.add('product');
    baskets.forEach(basket => {
        basketsTotalPrice += basket.count * basket.product.price;
    });
    dataproduct.innerHTML = `
                <span class="data-name">Ürünler Toplamı</span>
                <span class="data-value">${number_format(basketsTotalPrice)} TL</span>
    `;
    
    $(totalCard).append(dataproduct);

    //Taxes
    let totalTaxesPrice = 0;
    taxes.forEach(tax => {
        if(tax.price > 0){
            let totalCard = document.querySelector('.shopping-cart-total-card .card-body');
            let datatax = document.createElement('div');
            datatax.classList.add('data');
            datatax.classList.add('tax');
    
            datatax.innerHTML = `
                <span class="data-name">${tax.name} (${tax.amount})</span>
                <span class="data-value">${number_format(tax.price)} TL</span>
            `;
            
            totalTaxesPrice += tax.price;
            $(totalCard).append(datatax);
        }

    });

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
    let datadiscount = document.createElement('div');
    datadiscount.classList.add('data');
    datadiscount.classList.add('discount');
    let totalDiscountsPrice = 0;
    discounts.forEach(discount => {
        totalDiscountsPrice += discount.price;
    });

    datadiscount.innerHTML = `
        <span class="data-name">Toplam indirim</span>
        <span class="data-value">${number_format(totalDiscountsPrice)} TL</span>
    `;

    if(totalDiscountsPrice > 0){
        $(totalCard).append(datadiscount);
    }


    let totalPrice = basketsTotalPrice + totalTaxesPrice + totalCargoPrice - totalDiscountsPrice;

    let totalDiv = document.querySelector('.shopping-cart-total-card .card-footer .total-price .value');

    totalDiv.innerHTML = number_format(totalPrice) + " TL";
    }else{
        let totalPrice = 0;

        let totalDiv = document.querySelector('.shopping-cart-total-card .card-footer .total-price .value');
    
        totalDiv.innerHTML = number_format(totalPrice) + " TL";
    }


};

window.shoppingCardTotalUpdate = async function(){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/details-shopping-cart');
        calc_total(response.data.baskets, response.data.taxes, response.data.cargo, response.data.discounts);
    } catch (error) {
        throw error;
    }
}