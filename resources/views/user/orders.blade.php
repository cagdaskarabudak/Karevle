<x-page title="Siparişlerim">
    <x-account>
        <ul>
            @foreach(Auth::user()->orders as $order)
            <div class="order">
                <b>ID:</b> {{ $order->id }} &emsp; <b>Price:</b> {{ $order->total_price }} &emsp; <b>Status:</b> {{ $order->status->content }}
            </div>
            @endforeach
        </ul>
    </x-account>
</x-page>