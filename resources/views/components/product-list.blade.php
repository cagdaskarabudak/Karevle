<div class="row">
    <div class="col-lg-3 col-md-12 col-sm-12 mb-3">
        <div class="card filter-card">
            <div class="card-header filter-card-header d-sm-flex d-md-flex d-lg-none">
                Filtrele
                <i class="fa-solid fa-chevron-down"></i>
            </div>
            <div class="card-body filter-card-body">
                <div class="mb-3">
                    <select name="sortSelect" class="form-select sort-select">
                        <option value="">Sıralama</option>
                        <option value="highestPrice">En Yüksek Fiyat</option>
                        <option value="lowestPrice">En Düşük Fiyat</option>
                        <option value="latest">En Yeni</option>
                        <option value="oldest">En Eski</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="searchWithKey" class="form-label">Kelime ile arama</label>
                    <input type="text" id="searchWithKey" class="form-control">
                </div>
                <div class="mb-3 border p-2 rounded">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="filterGenderAll" checked>
                        <label class="form-check-label" for="filterGenderAll">
                            Tümünü Seç
                        </label>
                    </div>
                    <div class="form-check ps-5">
                        <input class="form-check-input" type="checkbox" value="" id="filterGenderFemale" checked>
                        <label class="form-check-label" for="filterGenderFemale">
                            Kadın
                        </label>
                    </div>
                        <div class="form-check ps-5">
                        <input class="form-check-input" type="checkbox" value="" id="filterGenderMale" checked>
                        <label class="form-check-label" for="filterGenderMale">
                            Erkek
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-9 col-md-12 col-sm-12">
        <div class="card products-card products-card-danger">
            <div class="card-body">
                @foreach($products as $product)
                    <x-product-card :product='$product' />
                @endforeach
            </div>
        </div>
    </div>
</div>