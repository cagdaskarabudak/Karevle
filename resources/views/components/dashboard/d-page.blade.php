<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ $title }} - {{ env('APP_NAME') }}</title>
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="{{ Vite::asset('resources/img/favicon.svg') }}">
        @vite(['resources/js/app.js', 'resources/sass/app.sass'])
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script type="module" src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    </head>
    <body>
        @include('layouts.dashboard.header')
        <div class="content-wrapper">
            {{ $slot }}
        </div>
        @include('layouts.footer')
        <div class="toast-container position-fixed top-0 end-0 p-3">

        </div>
        <div class="mobile-app-notf">
            <button class="btn-close"></button>
            <div class="content">
                <span>Karevle Mobil Uygulaması!</span>
                <button>İndir</button>
            </div>
        </div>
    </body>

      <script type="module">

        @if(session('autherror'))
            mainmethods.createToast("{{ session('autherror') }}");
        @endif
        
        function isMobileDevice() {
            return /Mobi|Android/i.test(navigator.userAgent);
        }

        if (isMobileDevice()) {
            mainmethods.mobileAppNotf();
        } else {
        }

      </script>
</html>
