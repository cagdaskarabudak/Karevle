class Filter{

    constructor(){
        this.productDoms = document.querySelectorAll('.list-product');
    }

    search(value){
        const searchTerms = value.split(' ').map(term => term.toLowerCase()).filter(term => term !== '');

        this.productDoms.forEach(productDom => {
            let productKeys = productDom.getAttribute('keys').split(' ').map(key => key.toLowerCase()).filter(key => key !== '');

            let isMatch = searchTerms.every(term =>
                productKeys.some(key => key.includes(term))
            );

            if(isMatch){
                productDom.style.display = 'flex';
            } else {
                productDom.style.display = 'none';
            }
        });
    }

    sort(type = 'normal'){
        let productsArray = Array.from(this.productDoms);

        switch(type) {
            case 'normal':
                break;

            case 'price_to_up':
                productsArray.sort((a, b) => {
                    let priceA = parseFloat(a.getAttribute('price'));
                    let priceB = parseFloat(b.getAttribute('price'));
                    return priceA - priceB;
                });
                break;

            case 'price_to_down':
                productsArray.sort((a, b) => {
                    let priceA = parseFloat(a.getAttribute('price'));
                    let priceB = parseFloat(b.getAttribute('price'));
                    return priceB - priceA;
                });
                break;

            case 'top_old':
                productsArray.sort((a, b) => {
                    let dateA = parseFloat(a.getAttribute('date'));
                    let dateB = parseFloat(b.getAttribute('date'));
                    return dateA - dateB;
                });
                break;

            case 'top_new':
                productsArray.sort((a, b) => {
                    let dateA = parseFloat(a.getAttribute('date'));
                    let dateB = parseFloat(b.getAttribute('date'));
                    return dateB - dateA;
                });
                break;

            default:
                console.warn('Unknown sort type:', type);
        }

        // Sıralanmış ürünleri DOM'a tekrar ekleyerek sıralamayı uygula
        const parent = this.productDoms[0].parentElement;
        productsArray.forEach(product => {
            parent.appendChild(product);
        });
    }

}

export default Filter;