@foreach($products as $product)
{{ $product->name }}
<hr />
@foreach($product->stores as $store)
{{ $store->name }} ({{ $store->stock }})
<hr />
@endforeach
@endforeach