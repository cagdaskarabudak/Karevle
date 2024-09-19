function debounce(func, wait) {
    let timeout;
    return function(...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), wait);
    };
}

let searchInput = document.querySelector('.search-div.search-sm form input');
if(searchInput){

    const debouncedSearch = debounce(async function(query) {
        if (query.length > 0) {
            let results = await search(query);
            searchBuild(results);
        }
    }, 300);

    searchInput.addEventListener('keyup', async function(e){
            let searchResults = this.parentElement.parentElement.querySelector('.search-results');
            if (this.value.length > 0) {
                this.parentElement.parentElement.classList.add('open');
                $(searchResults).show("slide", { direction: "up" }, 300);
            } else {
                this.parentElement.parentElement.classList.remove('open');
                $(searchResults).hide("slide", { direction: "up" }, 300);
            }
            debouncedSearch.call(this, this.value);
    });
}

async function search(keys){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/mainSearch', {
            keys: keys
        });
        return response.data;
    } catch (error) {
        throw error;
    }
}

async function searchBuild(results){
    let searchResults = searchInput.parentElement.parentElement.querySelector('.search-results');
    let resultCategories = searchResults.querySelector('.categories .items');
    let resultProducts = searchResults.querySelector('.products .items');
    resultCategories.innerHTML = "";
    resultProducts.innerHTML = "";
    results.categories.forEach(category => {
        let element = `
            <a class="search-item category" href="/kategoriler/${category.slug}">${category.name}</a>
        `;
        resultCategories.innerHTML += element;
    });
    results.products.forEach(product => {
        let element = `
            <a class="search-item product" href="#">${product.name}</a>
        `;
        resultProducts.innerHTML += element;
    });
}