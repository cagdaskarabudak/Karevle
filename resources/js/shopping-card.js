async function getProductInfo(product_id){
    try {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        let response = await $.post("/getProductInfo", {
            "_token": csrfToken,
            product_id: product_id
        });
        return response;
    } catch (error) {
        console.error("Error fetching product info:", error);
        return null;
    }
}

async function getBaskets(){
    try {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        let response = await $.post("/getBaskets", {
            "_token": csrfToken
        });
        return response;
    } catch (error) {
        console.error("Error fetching product info:", error);
        return null;
    }
}

class ShoppingCard {

    constructor(){
        this.baskets = [];
    }

    async add(id){

        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        $.post("/basket-product", {
            "_token": csrfToken,
            product_id: id
        });

        await this.refresh();
        if(window.location.pathname == '/sepetim'){
            await this.refreshPage();
        }
    }

    async remove(id) {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        $.post("/unbasket-product", {
            "_token": csrfToken,
            product_id: id
        });
        await this.refresh();
        if(window.location.pathname == '/sepetim'){
            await this.refreshPage();
        }
    }

    async refresh(){
        let shoppingCardDom = document.querySelector('.offcanvas-body .shopping-card');
        shoppingCardDom.innerHTML = '';

        let totalPriceDom = document.querySelector('.offcanvas-header .total span');
        let totalPrice = 0;

        this.baskets = await getBaskets();
        let basketsCountDom = document.querySelector('.offcanvas-title#shoppingCardOffCanvasLabel span');
        let basketsCountTopDom = document.querySelector('.shopping-card-nav-link span.badge');
        let basketCount = 0;
        this.baskets.forEach(basket => {
            this.create(basket);
            basketCount += basket.count;
            totalPrice += basket.count * basket.product.price;
        });

        totalPriceDom.innerHTML = totalPrice;
        basketsCountDom.innerHTML = basketCount;
        if(basketCount > 0){
            basketsCountTopDom.style.display = 'flex';
            basketsCountTopDom.innerHTML = basketCount;
            let scSuccessBtn = document.querySelector('.offcanvas-footer .shopping-card-success-btn');
            scSuccessBtn.href = '/';
        }
        else{
            let scSuccessBtn = document.querySelector('.offcanvas-footer .shopping-card-success-btn');
            scSuccessBtn.href = 'Javascript:void(0);';
            basketsCountTopDom.style.display = 'none';
        }
    }

    async refreshPage(){
        let shoppingCardDom = document.querySelector('.shopping-card-products-div .product-list');
        shoppingCardDom.innerHTML = '';

        let totalPriceDom = document.querySelector('.shopping-card-success-div .total-price span');
        let totalPrice = 0;

        this.baskets = await getBaskets();

        let basketsCountDom = document.querySelector('.shopping-card-success-div .total-count span');
        let basketCount = 0;

        this.baskets.forEach(basket => {
            this.createPage(basket);
            basketCount += basket.count;
            totalPrice += basket.count * basket.product.price;
        });

        totalPriceDom.innerHTML = totalPrice;
        basketsCountDom.innerHTML = basketCount;

        if(this.baskets.length > 0){
            document.querySelector('.shopping-card-success-btn').classList.remove('disable');
            document.querySelector('.shopping-card-destroy-btn').classList.remove('disable');
            document.querySelector('.start-to-trade-btn').classList.add('disable');
            document.querySelector('.shopping-card-success-div').style.display = 'block';
        }
        else{
            document.querySelector('.product-list.info-list').innerHTML = '<span class="empty-info"><i class="fa-regular fa-cart-shopping"></i><p>Sepetinizde ürün bulunmamaktadır.</p><a type="buttonh" href="/" class="start-to-trade-btn">Alışverişe Başla</a></span>';
            document.querySelector('.shopping-card-success-btn').classList.add('disable');
            document.querySelector('.shopping-card-destroy-btn').classList.add('disable');
            document.querySelector('.start-to-trade-btn').classList.remove('disable');
            document.querySelector('.shopping-card-success-div').style.display = 'none';
        }
    }

    create(basket){
        let product = document.createElement('div');
        product.classList.add('product');
        product.setAttribute('product-id', basket.product.id);

        let img = document.createElement('img');
        img.src = '/storage/product_images/'+basket.product.images[0].name;
        img.setAttribute('alt', basket.product.name+' Image');

        let info = document.createElement('div');
        info.classList.add('info');

        let name = document.createElement('h1');
        name.innerHTML = basket.product.name;

        let attributes = document.createElement('ul');
        attributes.classList.add('attributes');

        let li = document.createElement('li');

        let count = document.createElement('span');
        count.classList.add('count');
        count.innerHTML = 'Adet: ';

        let count_value = document.createElement('span');
        count_value.classList.add('count-value');
        count_value.innerHTML = basket.count;

        let price = document.createElement('div');
        price.classList.add('price');

        let product_total_price = document.createElement('span');
        product_total_price.classList.add('product-total-price');
        product_total_price.innerHTML = basket.count * basket.product.price + ' TL';

        let destroy_to_card = document.createElement('button');
        destroy_to_card.classList.add('destroy-to-card');
        destroy_to_card.innerHTML = '<i class="fa-solid fa-minus"></i>';
        destroy_to_card.addEventListener('click', function(){
            shoppingCard.remove(basket.product.id);
        });

        let add_to_card = document.createElement('button');
        add_to_card.classList.add('add-to-card');
        add_to_card.innerHTML = '<i class="fa-solid fa-plus"></i>';
        add_to_card.addEventListener('click', function(){
            shoppingCard.add(basket.product.id);
        });

        product.append(img);
        info.append(name);
        li.append(count);
        li.append(count_value);
        attributes.append(li);
        info.append(attributes);
        price.append(product_total_price);
        info.append(price);
        product.append(info);
        product.append(destroy_to_card);
        product.append(add_to_card);

        let shoppingCardDom = document.querySelector('.offcanvas-body .shopping-card');

        shoppingCardDom.append(product);

    }

    createPage(basket){

        let product = document.createElement('li');
        product.classList.add('product');

        let img = document.createElement('img');
        img.src = '/storage/product_images/'+basket.product.images[0].name;

        let info = document.createElement('div');
        info.classList.add('info');

        let name = document.createElement('h1');
        name.innerHTML = basket.product.name;

        let price = document.createElement('h2');
        price.innerHTML = basket.product.price+' TL';

        let count = document.createElement('span');
        count.classList.add('count');
        count.innerHTML = 'Adet: ' + basket.count;

        let add_to_card = document.createElement('button');
        add_to_card.classList.add('add-to-card');
        add_to_card.addEventListener('click', function(){
            shoppingCard.add(basket.product.id);
        });
        add_to_card.innerHTML = '<i class="fa-solid fa-plus"></i>';

        let destroy_to_card = document.createElement('button');
        destroy_to_card.classList.add('destroy-to-card');
        destroy_to_card.addEventListener('click', function(){
            shoppingCard.remove(basket.product.id);
        });
        destroy_to_card.innerHTML = '<i class="fa-solid fa-minus"></i>';

        let view = document.createElement('a');
        view.classList.add('view-product');
        view.href = '/urun/' + basket.product.slug;
        view.innerHTML = 'İncele';

        product.append(img);
        info.append(name);
        info.append(price);
        info.append(count);
        product.append(info);
        product.append(add_to_card);
        product.append(destroy_to_card);
        product.append(view);

        let shoppingCardDom = document.querySelector('.shopping-card-products-div .product-list');
        
        shoppingCardDom.append(product);
    }

    async clear(){
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        $.post("/clear-basket", {
            "_token": csrfToken
        });
        await this.refresh();
        if(window.location.pathname == '/sepetim'){
            await this.refreshPage();
        }
    }
}

export default ShoppingCard;