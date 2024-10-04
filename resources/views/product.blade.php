<x-page :title="$product->name">
    <div class="row">
        <div class="col-lg-12">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item text-primary" style="font-size: 10pt"><a class="text-decoration-none text-primary" style="font-size: 10pt" href="{{ route('home') }}"><img src="{{ asset('storage/main_images/favicon.svg') }}" alt="Favicon" height="24pt">{{ env('APP_NAME') }}</a></li>
                  @foreach($product->category->getTopMostCategory() as $topCategory)
                    <li class="breadcrumb-item text-secondary" aria-current="page" style="font-size: 10pt"> <a class="text-decoration-none text-secondary" style="font-size: 10pt" href="{{ route('category.view', $topCategory->slug) }}">{{ $topCategory->name }}</a></li>
                  @endforeach
                </ol>
            </nav>
        </div>
        <div class="col-lg-4 product-images-card mb-3">
            <div class="swiper product-images-swiper">
                <div class="swiper-wrapper">
                    @foreach($product->medias as $media)
                    <div class="swiper-slide">
                        @if($media->type == 'video')
                            <video muted loop>
                                <source src="/storage/product_medias/{{ $media->name }}" type="video/mp4">
                            </video>
                        @elseif($media->type == 'image')
                            <img src="/storage/product_medias/{{ $media->name }}">
                        @endif
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="swiper-navigation">
                <button class="prev-btn"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="next-btn"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
            <div class="swiper-pagination"></div>
        </div>
        <div class="col-lg-8">
            <div class="card product-info-card">
                <div class="card-body">
                    <div class="product-lists ">
                        @foreach($product->lists as $liste)
                        <div class="product-list product-list-{{ $liste->color }}"><i class="fa-solid {{ $liste->icon }}"></i>  {{ $liste->short_name }}</div>
                        @endforeach
                    </div>
                    <div class="product-info">
                        <div class="name">
                            {{ $product->name }}
                        </div>
                        <div class="rate">
                            <div class="rating-amount">{{ $product->rate }}</div>
                            <div class="rating-stars"></div>
                            <div class="rating-count">({{ count($product->comments) }})</div>
                        </div>
                        <div class="price">{{ number_format($product->price, 2, ',', '.') }} TL</div>
                    </div>
                </div>
            </div>
            <div class="product-action-buttons">
                <a href="Javascript:void(0);" class="shopping-card-btn" data-id="{{ $product->id }}"><i class="fa-solid fa-shopping-cart"></i><span>SEPETE EKLE</span></a>
                @auth <a href="Javascript:void(0);" data-product-id="{{ $product->id }}" class="add-favorites-btn @if($product->isFavoritedUser(Auth::user()->id)) favorited @endif"><i class="fa-solid @if($product->isFavoritedUser(Auth::user()->id)) fa-heart-circle-check @else fa-heart @endif"></i></a> @endauth
            </div>
        </div>
        @if($product->content)
        <div class="col-lg-12">
            <div class="card mt-3">
                <div class="card-body">
                    <div class="product-content">
                        {{ $product->content->content }}
                    </div>
                </div>
            </div>
        </div>
        @endif
        <div class="col-lg-12 product-comments">
            @foreach($product->comments as $comment)
            <div class="product-comment">
                <div class="comment-header">{{ $comment->user->first_name.' '.$comment->user->last_name }}</div>
                <div class="comment-body">{{ $comment->comment }}</div>
                @if(count($comment->medias) > 0)
                <div class="comment-medias">
                    @foreach($comment->medias as $media)
                    <div class="comment-media">
                        <button class="btn btn-dark text-light close-btn"><i class="fa-solid fa-x"></i></button>
                        @if($media->type == 'image')
                        <img class="" src="/storage/comment_medias/{{ $media->name }}">
                        @elseif($media->type == 'video')
                        <div class="icon"><i class="fa-solid fa-play"></i></div>
                        <video loop muted>
                            <source src="/storage/comment_medias/{{ $media->name }}" type="video/mp4">
                        </video>
                        @endif
                    </div>
                    @endforeach
                </div>
                @endif
                <div class="comment-footer"> <div class="comment-rating"><div class="comment-rating-amount" data-rate="{{ $comment->rate }}">{{ $comment->rate }}</div><div class="comment-rating-stars"></div></div><div class="created-date">{{ $comment->created_at }}</div></div>
            </div>
            @endforeach
        </div>
    </div>
    <script type="module">
        let productMedias = @json($product->medias);
        new Swiper('.swiper.product-images-swiper', {
            slidesPerView: 1,
            navigation: {
                nextEl: '.product-images-card .next-btn',
                prevEl: '.product-images-card .prev-btn',
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            loop: true
        });

        $('.rating-stars').rateYo({
            rating: @json($product->rate),
            starWidth: "15px",
            readOnly: true
        });

        const slideVideos = document.querySelectorAll('.swiper-slide video');

        if(slideVideos){
            slideVideos.forEach(slideVideo => {
                // Mouse üzerine geldiğinde video baştan başlasın ve oynasın
                slideVideo.addEventListener('mouseover', () => {
                    slideVideo.currentTime = 0;  // Video baştan başlasın
                    slideVideo.play();  // Video oynat
                });
                slideVideo.addEventListener('touchstart', (e) => {
                    e.preventDefault();
                    slideVideo.currentTime = 0;  // Video baştan başlasın
                    slideVideo.play();  // Video oynat
                });

                // Mouse videonun üzerinden ayrıldığında video başa dönsün ve durdurulsun
                slideVideo.addEventListener('mouseout', () => {
                    slideVideo.pause();  // Video durdur
                    slideVideo.currentTime = 0;  // Video başa sar
                });
                slideVideo.addEventListener('touchend', (e) => {
                    slideVideo.pause();  // Video durdur
                    slideVideo.currentTime = 0;  // Video başa sar
                });
                slideVideo.addEventListener('touchcancel', (e) => {
                    slideVideo.pause();  // Video durdur
                    slideVideo.currentTime = 0;  // Video başa sar
                });
            });
        }

        const commentMedias = document.querySelectorAll('.comment-media');
        if(commentMedias){
            commentMedias.forEach(commentMedia => {
                commentMedia.addEventListener('click', function(e){
                    if(commentMedia.classList.contains('show')){
                        if(e.target != commentMedia.querySelector('img') && e.target != commentMedia.querySelector('video')){
                            commentMedia.classList.remove('show');
                            let video = commentMedia.querySelector('video');
                            if(video && !video.paused){
                                video.currentTime = 0;
                                video.pause();
                                $(commentMedia.querySelector('.icon')).show();
                            }
                        }
                        if(e.target == commentMedia.querySelector('video')){
                            let video = commentMedia.querySelector('video');
                            if(video){
                                if(video.paused){
                                    video.play();
                                    $(commentMedia.querySelector('.icon')).hide();
                                }
                                else{
                                    video.pause();
                                    $(commentMedia.querySelector('.icon')).show();
                                }
                            }
                        }
                    }
                    else{
                        commentMedia.classList.add('show');
                        let video = commentMedia.querySelector('video');
                            if(video){
                                video.currentTime = 0;
                                video.play();
                                $(commentMedia.querySelector('.icon')).hide();
                            }
                    }
                });
            });
        }
    </script>
</x-page>