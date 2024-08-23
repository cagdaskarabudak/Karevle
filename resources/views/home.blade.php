<x-page title="Home">
    <div class="container">
        @include('layouts.slider', $sliders)
        @foreach($lists as $list)
            @if( count($list->products) > 0)
                @include('layouts.highlights', $list)
            @endif
        @endforeach
    </div>
</x-page>

