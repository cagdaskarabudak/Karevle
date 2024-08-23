async function getFavorites(){
    try {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        let response = await $.post("/getFavoritedProducts", {
            "_token": csrfToken
        });
        return response;
    } catch (error) {
        console.error("Error fetching product info:", error);
        return null;
    }
}

let favoriteButtons = document.querySelectorAll('button.favorite-btn');
favoriteButtons.forEach(favoriteButton => {
    favoriteButton.addEventListener('click', function(){
        if(!favoriteButton.classList.contains('favorite')) {
            let productid = Number(favoriteButton.getAttribute('product-id'));
            favorites.add(productid);
            favoriteButton.classList.add('favorite');
            favoriteButton.querySelector('svg').setAttribute('data-prefix', 'fas');
        }
        else{
            let productid = Number(favoriteButton.getAttribute('product-id'));
            favorites.remove(productid);
            favoriteButton.classList.remove('favorite');
            favoriteButton.querySelector('svg').setAttribute('data-prefix', 'fat');
        }
    });
});

class Favorites{
    constructor(){
        this.favorites = [];
    }

    async add(id){
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        $.post("/favoritedProduct", {
            "_token": csrfToken,
            product_id: id
        }, function(res){
        });

        await this.refresh();
    }

    async remove(id) {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        $.post("/unFavoritedProduct", {
            "_token": csrfToken,
            product_id: id
        }, function(res){
        });

        await this.refresh();
    }

    async refresh(){
        let favorites = await getFavorites();
        let favoritesBadgeDom = document.querySelector('.favorites-nav-link span.badge');
        if(favorites.length > 0){
            favoritesBadgeDom.style.display = 'flex';
            favoritesBadgeDom.innerHTML = favorites.length;
        }
        else{
            favoritesBadgeDom.style.display = 'none';
            favoritesBadgeDom.innerHTML = '';
        }
    }
}

export default Favorites;