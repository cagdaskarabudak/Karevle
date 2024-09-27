let productFavoriteButtons = document.querySelectorAll('.product-card button.product-favorite-btn');
if(productFavoriteButtons){

    productFavoriteButtons.forEach(productFavoriteButton => {
        productFavoriteButton.addEventListener('click', async function(){
            this.disabled = true;
            let productid = this.getAttribute('data-product-id');
            if(this.classList.contains('favorited')){
                let result = await removeFavorites(productid);
                this.classList.remove('favorited');
                let iconSvg = this.querySelector('svg');
                iconSvg.setAttribute('data-icon', 'heart');
                iconSvg.setAttribute('data-prefix', 'far');
                if(window.location.pathname == '/favorilerim'){
                    $(this.parentElement).hide(500);
                }
            }
            else{
                let result = await addFavorites(productid);
                this.classList.add('favorited');
                let iconSvg = this.querySelector('svg');
                iconSvg.setAttribute('data-icon', 'heart-circle-check');
                iconSvg.setAttribute('data-prefix', 'fas');
            }
            this.disabled = false;
        });
    });
}

let addFavoritesBtn = document.querySelector('.add-favorites-btn');
if(addFavoritesBtn){
    addFavoritesBtn.addEventListener('click', async function(){
        this.disabled = true;
        let productid = this.getAttribute('data-product-id');
        if(this.classList.contains('favorited')){
            let result = await removeFavorites(productid);
            this.classList.remove('favorited');
            let iconSvg = this.querySelector('svg');
            iconSvg.setAttribute('data-icon', 'heart');
            iconSvg.setAttribute('data-prefix', 'far');
            if(window.location.pathname == '/favorilerim'){
                $(this.parentElement).hide(500);
            }
        }
        else{
            let result = await addFavorites(productid);
            this.classList.add('favorited');
            let iconSvg = this.querySelector('svg');
            iconSvg.setAttribute('data-icon', 'heart-circle-check');
            iconSvg.setAttribute('data-prefix', 'fas');
        }
        this.disabled = false;
    });
}

async function addFavorites(id){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/addFavorites', {
            productid: id
        });
        return response.data;
    } catch (error) {
        console.error('Error:', error);
        throw error;
    }
}

async function removeFavorites(id){
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    try {
        const response = await axios.post('/removeFavorites', {
            productid: id
        });

        return response.data;
    } catch (error) {
        console.error('Error:', error);
        throw error;
    }
}

document.addEventListener('DOMContentLoaded', function(){
    let commentratings = document.querySelectorAll('.comment-rating');

    if(commentratings){
        commentratings.forEach(commentrating => {
            let rateAmount = commentrating.querySelector('.comment-rating-amount').getAttribute('data-rate');
    
            let rateStars = commentrating.querySelector('.comment-rating-stars');
            $(rateStars).rateYo({
                rating: rateAmount,
                starWidth: "10px",
                readOnly: true
            });
        });
    }
});

