<x-page :title='$keys'>
    <div class="col-lg-12">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item text-primary" style="font-size: 10pt"><a class="text-decoration-none text-primary" style="font-size: 10pt" href="{{ route('home') }}"><img src="{{ asset('storage/main_images/favicon.svg') }}" alt="Favicon" height="24pt">{{ env('APP_NAME') }}</a></li>
                <li class="breadcrumb-item active text-warning" aria-current="page" style="font-size: 10pt"> <i class="fa-solid fa-search"></i> Arama Sonucu: {{ $keys }}</li>
            </ol>
        </nav>
    </div>
    <div class="col-lg-12 p-1">
        <div class="count-info">
            {{ count($products) }} Ürün listeleniyor.
        </div>
    </div>
    <x-product-list :products='$products' />
</x-page>