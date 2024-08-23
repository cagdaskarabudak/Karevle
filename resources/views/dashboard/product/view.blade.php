<x-d-page title="Ürünler - Yönetim Paneli">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="card products-card">
                    <div class="card-header">
                        <a href="{{ route('dashboard.products.create.view') }}" class="btn btn-success text-light">Ürün Oluştur</a>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover products-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Görüntü</th>
                                    <th>Ürün Adı</th>
                                    <th>Fiyatı</th>
                                    <th>İndirimli Fiyatı</th>
                                    <th>Kategori</th>
                                    <th>İşlem</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($products as $product)
                                    <tr>
                                        <td>{{ $product->id }}</td>
                                        <td><img src="/storage/product_images/{{ $product->images->first()->name }}"></td>
                                        <td>{{ $product->name }}</td>
                                        <td>{{ $product->price }}</td>
                                        <td>{{ $product->new_price() }}</td>
                                        <td>{{ $product->category->name }}</td>
                                        <td>
                                            <div class="dropdown">
                                                <a type="button" href="#" class="btn btn-info" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                                </a>
                                                <div class="dropdown-menu">
                                                    <a href="#" class="dropdown-item">Kampanyaları Düzenle</a>
                                                    <a type="button" data-bs-target="#lists_modal" data-bs-toggle="modal" class="dropdown-item" product-id="{{ $product->id }}">Listeleri Düzenle</a>
                                                    <a href="{{ route('dashboard.products.update.view', $product->id) }}" class="dropdown-item">Düzenle</a>
                                                    <a href="Javascript:void(0)" product-id="{{ $product->id }}" class="dropdown-item product-destroy-btn">Sil</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="lists_modal" tabindex="-1" aria-labelledby="lists_modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <select name="lists_select" id="lists_select">
                    @foreach($lists as $list)
                        <option value="{{ $list->id }}">{{ $list->name }}</option>
                    @endforeach
                </select>
            </div>
          </div>
        </div>
      </div>
</x-d-page>
<script type="module">
    let products = @json($products);
    console.log(products);
    document.addEventListener('DOMContentLoaded', function(){
        let productDestroyButtons = document.querySelectorAll('.product-destroy-btn');
        productDestroyButtons.forEach(productDestroyButton => {
            productDestroyButton.addEventListener('click', function(){
                console.log('clicked');
                let productid = this.getAttribute('product-id');
                let productDeleteConfirmation = confirm('ürünü silmek istediğinize emin misiniz?');
                if(productDeleteConfirmation){
                    $.post("{{ route('dashboard.products.destroy') }}", {
                        "_token": "{{ csrf_token() }}",
                        productid:productid,
                    }, function(res){
                        console.log(res);
                        if(res === 'success'){
                            let parentel = productDestroyButton.parentElement;
                            parentel = parentel.parentElement;
                            parentel = parentel.parentElement;
                            parentel = parentel.parentElement;
                            $(parentel).hide(500);
                        }
                    });
                }
            });
        });

    });

</script>