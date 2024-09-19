/*

width <= 575            : xs
576 <= width <= 767     : sm
768 <= width <= 991     : md
992 <= width <= 1199    : lg
1200 <= width <= 1399   : xl
1400 <= width           : xxl

*/

let filterCard = document.querySelector('.filter-card');
let filterHeader = document.querySelector('.filter-card-header');
let filterCardBody = document.querySelector('.filter-card-body');

if(filterHeader){
    filterHeader.addEventListener('click', function(){
        $(filterCardBody).slideToggle(500);
        let filterHeaderIcon = filterHeader.querySelector('svg');
        if(filterHeaderIcon.getAttribute('data-icon') == 'chevron-down'){
            filterHeaderIcon.setAttribute('data-icon', 'chevron-up');
        }
        else{
            filterHeaderIcon.setAttribute('data-icon', 'chevron-down');
        }
    });
}

let sortSelect = document.querySelector('.filter-card-body .sort-select');
if(sortSelect){
    sortSelect.addEventListener('change', function(){
        if(this.value == 'highestPrice'){
            const items = Array.from(document.querySelectorAll('.product-card'));
    
            items.sort((a, b) => {
                const dateA = a.getAttribute('data-price');
                const dateB = b.getAttribute('data-price');
                return dateB - dateA;
            });
    
            const container = document.querySelector('.products-card');
            items.forEach(item => container.appendChild(item));
        }
        else if(this.value == 'lowestPrice'){
            const items = Array.from(document.querySelectorAll('.product-card'));
    
            items.sort((a, b) => {
                const dateA = a.getAttribute('data-price');
                const dateB = b.getAttribute('data-price');
                return dateA - dateB;
            });
    
            const container = document.querySelector('.products-card');
            items.forEach(item => container.appendChild(item));
        }
        else if(this.value == 'latest'){
            const items = Array.from(document.querySelectorAll('.product-card'));
    
            items.sort((a, b) => {
                const dateA = new Date(a.getAttribute('data-created-at'));
                const dateB = new Date(b.getAttribute('data-created-at'));
                return dateB - dateA;
            });
    
            const container = document.querySelector('.products-card');
            items.forEach(item => container.appendChild(item));
        }
        else if(this.value == 'oldest'){
            const items = Array.from(document.querySelectorAll('.product-card'));
    
            items.sort((a, b) => {
                const dateA = new Date(a.getAttribute('data-created-at'));
                const dateB = new Date(b.getAttribute('data-created-at'));
                return dateA - dateB;
            });
    
            const container = document.querySelector('.products-card');
            items.forEach(item => container.appendChild(item));
        }
    });
}


let products = document.querySelectorAll('.product-card');
let searchWithKey = document.querySelector('#searchWithKey');
if(searchWithKey){
    searchWithKey.addEventListener('keyup', function() {
        let searchValue = this.value.trim();
    
        products.forEach(product => {
            let keys = product.getAttribute('data-keys');
            
            if (!keys) {
                $(product).hide();
                return;
            }
    
            let searchKeys = searchValue.split(" ").filter(key => key !== "");
            let productKeys = keys.split(" ").filter(key => key !== "");
    
            const intersection = searchKeys.some(searchKey =>
                productKeys.some(productKey => productKey.includes(searchKey) || searchKey.includes(productKey))
            );
    
            if (searchValue.length === 0 || intersection) {
                $(product).show();
            } else {
                $(product).hide();
            }
        });
    });
}


let filterGenderAll = document.querySelector('#filterGenderAll');
let filterGenderFemale = document.querySelector('#filterGenderFemale');
let filterGenderMale = document.querySelector('#filterGenderMale');

if(filterGenderAll){
    filterGenderAll.addEventListener('change', function(){
        if(this.checked){
            filterGenderFemale.checked = true;
            filterGenderMale.checked = true;
            products.forEach(product => {
                $(product).show();
            });
        } 
        else{
            filterGenderFemale.checked = false;
            filterGenderMale.checked = false;
            products.forEach(product => {
                $(product).hide();
            });
        }
    });
}

if(filterGenderFemale){
    filterGenderFemale.addEventListener('change', function(){
        if(this.checked){
            products.forEach(product => {
                if(product.getAttribute('data-gender-category') == 'Kadın'){
                    $(product).show();
                }
            });
        }
        else{
            products.forEach(product => {
                if(product.getAttribute('data-gender-category') == 'Kadın'){
                    $(product).hide();
                }
            });
        }
    });
}

if(filterGenderMale){
    filterGenderMale.addEventListener('change', function(){
        if(this.checked){
            products.forEach(product => {
                if(product.getAttribute('data-gender-category') == 'Erkek'){
                    $(product).show();
                }
            });
        }
        else{
            products.forEach(product => {
                if(product.getAttribute('data-gender-category') == 'Erkek'){
                    $(product).hide();
                }
            });
        }
    });
}



