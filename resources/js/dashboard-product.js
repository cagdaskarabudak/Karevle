class Product{
    constructor(name = "", images = [], price = 0, slug = "", category = 0, content = "") {
        this.name = name;
        this.images = images;
        this.price = price;
        this.slug = slug;
        this.category = category;
        this.content = content;
    }

    setName(name){
        this.name = name;
    }

    setSlug(slug){
        this.slug = slug;
    }

    setImages(images){
        this.images = images;
    }

    setPrice(price){
        this.price = price;
    }

    setCategory(category){
        this.category = category;
    }

    setContent(content){
        this.content = content;
    }

    getName(){
        return this.name;
    }

    getSlug(){
        return this.slug;
    }

    getImages(){
        return this.images;
    }

    destroyImage(index){
        if (this.images.length > 0) {
            this.images.splice(index, 1);
        }
    }

    getPrice(){
        return this.price;
    }

    getCategory(){
        return this.category;
    }

    getContent(){
        return this.content;
    }
}

export default Product;