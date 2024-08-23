<x-d-page title="Ürün Oluştur - Yönetim Paneli">
    <div class="container">
        <div class="row">
            <div class="card create-product-card">
                <div class="card-body">
                        <div class="mb-3">
                            <div class="get-console-product">Get Product Class</div>
                        </div>
                        <div class="mb-3 product-images-selection">
                            <label for="product_images" class="product_images_label">Ürün Görüntülerini Seç</label>
                            <input type="file" multiple id="product_images" name="product_images">
                            <div class="product-images-review">
                                <h1>Şuan bir görüntü yüklemediniz. Görüntüler burada görünecek.</h1>
                            </div>
                        </div>
                        <div class="mb-3 product-name-selection">
                            <label for="product_name" class="form-label">Ürün İsmi</label>
                            <input type="text" class="form-control" id="product_name">
                        </div>
                        <div class="mb-3 product-slug-selection">
                            <label for="product_slug" class="form-label">Ürün Bağlantısı</label>
                            <input type="text" value="" class="form-control" id="product_slug" disabled>
                        </div>
                        <div class="mb-3 product-category-selection">
                            <label for="product_category" class="form-label">Ürün Kategorisi</label>
                            <select id="product_category" class="form-control">
                                <option value="0">Bir Kategori Seçin</option>
                                @foreach($categories as $category)
                                    @if(!$category->isTopCategory())
                                        <option value="{{$category->id}}">@foreach($category->getTopMostCategory() as $ctg) @if(!$loop->last) {{ $ctg->name.' > ' }} @else {{ $ctg->name }}@endif @endforeach</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3 product-category-selection">
                            <label for="product_lists" class="form-label">Listeler</label>
                            <select id="product_lists" class="form-control" multiple="multiple">
                                <option value="0">Bir Liste Seçin</option>
                                @foreach($lists as $list)
                                        <option value="{{$list->id}}" data-icon="fa-solid {{ $list->icon }}" data-color="{{ $list->color }}">{{ $list->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-3 product-price-selection">
                            <label for="product_price" class="form-label">Ürün Fiyatı</label>
                            <input type="number" id="product_price" class="form-control" placeholder="0,00" step="0.01">
                        </div>

                        <div class="mb-3 product-content-selection">
                            <label for="product_content" class="form-label">Ürün Açıklaması</label>
                            <textarea id="product_content" cols="30" rows="10" class="form-control"></textarea>
                        </div>

                        <div class="mb-3">
                            <button class="btn btn-success text-light create-product-btn">Ürün Oluştur</button>
                        </div>
                </div>
            </div>
        </div>
    </div>
</x-d-page>
<script type="module">
    let product = new Product(
        @json($product->name),
        @json($product->images),
        @json($product->price),
        @json($product->slug),
        @json($product->category->id),
        @json($product->content->content)
    );

    function placeProduct(){
        document.querySelector('#product_name').value = product.getName();
        document.querySelector('#product_price').value = product.getPrice();
        document.querySelector('#product_slug').value = product.getSlug();
        $('#product_category').val(product.getCategory()).trigger('change');
        document.querySelector('#product_content').value = product.getContent();
    }

    placeProduct();

    document.querySelector('.get-console-product').addEventListener('click', function(){
        console.log(product)
    });

    document.querySelector('input#product_images').addEventListener('change', function(e) {
        let images = Array.from(e.target.files);
        let reviewDiv = document.querySelector('.product-images-review');
        reviewDiv.innerHTML = "";
        console.log(images);
        
        if(images) {
            product.setImages(images);
            refreshImages();
        }
    });

    async function refreshImages() {
    let images = product.getImages();
    let reviewDiv = document.querySelector('.product-images-review');
    reviewDiv.innerHTML = "";

    if (images && images.length > 0) {
        for (let index = 0; index < images.length; index++) {
            const image = images[index];

            const reader = new FileReader();
            const result = await new Promise((resolve, reject) => {
                reader.onload = function(event) {
                    resolve(event.target.result);
                };
                reader.onerror = reject;
                reader.readAsDataURL(image);
            });

            // Görüntü elemanlarını oluşturma
            const imgreview = document.createElement('div');
            imgreview.classList.add('img-review');
            imgreview.setAttribute('index', index);

            const destroybtn = document.createElement('button');
            destroybtn.classList.add('destroy-btn');
            destroybtn.innerHTML = '<i class="fa-solid fa-trash"></i>';
            destroybtn.type = 'button';
            destroybtn.addEventListener('click', function(dbtn) {
                let imageIndex = index;

                product.destroyImage(imageIndex);
                refreshImages();
            });

            const moveicon = document.createElement('i');
            moveicon.classList.add('move-icon');
            moveicon.classList.add('fa-solid');
            moveicon.classList.add('fa-up-down-left-right');

            const firstcontent = document.createElement('div');
            firstcontent.classList.add('first-content');
            firstcontent.innerHTML = "Vitrin";

            const img = document.createElement('img');
            img.src = result;

            imgreview.append(moveicon);
            imgreview.append(destroybtn);
            imgreview.append(img);
            imgreview.append(firstcontent);

            reviewDiv.append(imgreview);
        }

        // Sortable işlevselliği
        $('.product-images-review').sortable({
            cursor: "move",
            update: function(event, ui) {
                let reviewDoms = document.querySelectorAll('.product-images-review .img-review');
                let imgsorts = [];
                reviewDoms.forEach((reviewDom, index) => {
                    imgsorts.push(Number(reviewDom.getAttribute('index')));
                    reviewDom.setAttribute('index', index);
                });
                let newImages = [];
                let productImages = product.getImages();
                imgsorts.forEach(imgsort => {
                    newImages.push(productImages[imgsort]);
                });
                product.setImages(newImages);
            }
        });
        $('.product-images-review').disableSelection();
    }
    else{
        let h1 = document.createElement('h1');
        h1.innerHTML = 'Şuan bir görüntü yüklemediniz. Görüntüler burada görünecek.';
        reviewDiv.append(h1);
        $('.product-images-review').sortable("destroy");
    }
}

// checkSlug fonksiyonu bir Promise döndürür
async function checkSlug(slug) {
    try {
        const response = await $.post("{{ route('check.slug') }}", {
            "_token": "{{ csrf_token() }}",
            slug: slug
        });
        return response;
    } catch (error) {
        console.error('Error checking slug:', error);
        return false; // Hata durumunda false dönebilir
    }
}

function generate10DigitRandomNumber() {
    // 10 basamaklı rastgele bir sayı oluşturur
    return Math.floor(1000000000 + Math.random() * 9000000000);
}

async function createSlug(string) {
    // Türkçe karakterleri İngilizce karakterlere dönüştür
    const translit = {
        'Ç': 'C', 'ç': 'c',
        'Ğ': 'G', 'ğ': 'g',
        'İ': 'I', 'ı': 'i',
        'Ö': 'O', 'ö': 'o',
        'Ş': 'S', 'ş': 's',
        'Ü': 'U', 'ü': 'u',
        ' ': '-', '_': '-',
        ',': '-'
    };

    let slug = string.replace(/./g, char => translit[char] || char);

    // Harf ve rakam dışındaki karakterleri kaldır
    slug = slug.replace(/[^a-zA-Z0-9\-]/g, '');

    // Birden fazla tireyi tek tireye dönüştür
    slug = slug.replace(/-{2,}/g, '-');

    // Başında ve sonunda kalan tireleri kaldır
    slug = slug.replace(/^-+|-+$/g, '');

    // Tüm harfleri küçük harfe dönüştür
    slug = slug.toLowerCase();

    const isUnique = await checkSlug(slug);

    console.log(isUnique);
    if (isUnique) {
        return slug;
    } else {
        // Burada alternatif bir slug oluşturma veya hata işleme yapılabilir
        return slug + '.' + generate10DigitRandomNumber();
    }
}



    document.querySelector('input#product_name').addEventListener('keyup', async function(){
        let slug = await createSlug(this.value);

        document.querySelector('input#product_slug').value = slug;

        product.setName(this.value);
        product.setSlug(slug);
    });

    document.querySelector('#product_content').addEventListener('keyup', async function(){
        product.setContent(this.value);
    });

    document.querySelector('input#product_price').addEventListener('keyup', function(){
        product.setPrice(this.value);
    });

    $(document).ready(function(){
        $('#product_category').select2().on('select2:select', function(e){
            product.setCategory(e.params.data.id);
        });

            // Select2'yi başlat
        $('#product_lists').select2({
            templateResult: formatOption, // Dropdown'daki seçenekleri özelleştirmek için
            templateSelection: formatOptionSelection // Seçili seçenekleri özelleştirmek için
        });

        // Dropdown'daki her bir option'u özelleştirme
        function formatOption(option) {
            if (!option.id) {
                return option.text; // Eğer id yoksa, normal text döndür
            }
            
            // İkondan ve metinden oluşan HTML yapısı oluşturma
            var $option = $(
                '<span class="text-'+ $(option.element).data('color') +'"><i class="' + $(option.element).data('icon') + '"></i> ' + option.text + '</span>'
            );
            return $option;
        }

        // Seçili olan option'ları özelleştirme
        function formatOptionSelection(option) {
            if (!option.id) {
                return option.text;
            }
            
            // Seçilen öğeyi de aynı şekilde ikonlu gösterebiliriz
            var $selectedOption = $(
                '<span><i class="' + $(option.element).data('icon') + '"></i> ' + option.text + '</span>'
            );
            return $selectedOption;
        }
    });
    

    document.querySelector('.create-product-btn').addEventListener('click', function(){
        if(product.getName() == ''){
            alert('ürün ismi girilmemiş');
        }
        else if(product.getPrice() == 0){
            alert('ürün fiyatı girilmemiş');
        }
        else if(product.getSlug() == ''){
            alert('ürün bağlantısı geçersiz');
        }
        else if(product.getImages().length == 0){
            alert('ürün görüntüleri yüklenmemiş');
        }
        else if(product.getCategory() == 0){
            alert('ürün kategorisi seçilmemiş');
        }
        else{
            let formData = new FormData();
            formData.append("_token", "{{ csrf_token() }}");
            formData.append("name", product.getName());
            formData.append("slug", product.getSlug());
            formData.append("price", product.getPrice());
            formData.append("old_price", 0);
            formData.append("category", product.getCategory());
            formData.append("content", product.getContent());
            
            // Eğer images bir dizi ise, her bir dosyayı ekleyin
            if (product.getImages() && Array.isArray(product.getImages())) {
                product.getImages().forEach((image, index) => {
                    formData.append('images[]', image); // 'images[]' olarak ekleyin
                });
            }

            $.ajax({
                url: "{{ route('dashboard.products.create.create') }}",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(res) {
                    console.log(res);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

    });


</script>