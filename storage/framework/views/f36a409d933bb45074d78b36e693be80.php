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
                <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if (isset($component)) { $__componentOriginalecfc721726b8b5798826c96d529d8b59 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalecfc721726b8b5798826c96d529d8b59 = $attributes; } ?>
<?php $component = App\View\Components\ProductCard::resolve(['product' => $product] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('product-card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\ProductCard::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalecfc721726b8b5798826c96d529d8b59)): ?>
<?php $attributes = $__attributesOriginalecfc721726b8b5798826c96d529d8b59; ?>
<?php unset($__attributesOriginalecfc721726b8b5798826c96d529d8b59); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalecfc721726b8b5798826c96d529d8b59)): ?>
<?php $component = $__componentOriginalecfc721726b8b5798826c96d529d8b59; ?>
<?php unset($__componentOriginalecfc721726b8b5798826c96d529d8b59); ?>
<?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
</div><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/components/product-list.blade.php ENDPATH**/ ?>