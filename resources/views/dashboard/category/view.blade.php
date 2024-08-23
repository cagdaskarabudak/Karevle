<x-d-page title="Kategoriler - Yönetim Paneli">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="card products-card">
                    <div class="card-header">
                        <a href="{{ route('dashboard.products.create.view') }}" class="btn btn-success text-light">Kategori Oluştur</a>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover products-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Kategori Adı</th>
                                    <th>Kategori Yolu</th>
                                    <th>İşlem</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($categories as $category)
                                    <tr>
                                        <td>{{ $category->id }}</td>
                                        <td>{{ $category->name }}</td>
                                        <td>@foreach($category->getTopMostCategory() as $mostCategory){{ $mostCategory->name }} @if(!$loop->last) > @endif @endforeach</td>
                                        <td>
                                            <div class="dropdown">
                                                <a type="button" href="#" class="btn btn-info" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                                </a>
                                                <div class="dropdown-menu">
                                                    <a href="#" class="dropdown-item">Düzenle</a>
                                                    <a href="Javascript:void(0)" category-id="{{ $category->id }}" class="dropdown-item product-destroy-btn">Sil</a>
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
</x-d-page>