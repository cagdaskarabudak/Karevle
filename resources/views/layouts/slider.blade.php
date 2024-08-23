<div class="slider-card">
    <div class="swiper" id="slider">
        <div class="swiper-wrapper">
            @foreach($sliders as $slider)
            <a class="swiper-slide {{ $slider->text_position }} {{ $slider->theme }}-theme">
                <img src="/storage/slider_images/{{ $slider->image_name }}">
                <div class="content-opaciter"></div>
                <h1>{{ $slider->title }}</h1>
                <p>{{ $slider->content }}</p>
            </a>
            @endforeach
        </div>
    </div>
    <div class="swiper-pagination"></div>
</div>
<script type="module">
    let slider = new Swiper('.slider-card .swiper#slider', {
        slidesPerView: 1,
        autoplay: {
            pauseOnMouseEnter: true
        },
        loop: true,
        pagination: {
            el: '.slider-card .swiper-pagination',
        }
    });
</script>