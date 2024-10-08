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
        <link rel="icon" type="image/x-icon" href="{{ Storage::url('main_images/favicon.svg') }}">
        @vite(['resources/sass/app.sass', 'resources/js/app.js'])
    </head>
    <body>
            @include('layouts.loading-screen')
            @include('layouts.dashboard-navbar')
            <div class="content-wrapper">
                <div class="container">
                    {{ $slot }}
                </div>
            </div>
            @include('layouts.footer')
            <div class="toast-container position-fixed top-0 end-0 p-3">
    
            </div>
    </body>

      <script type="module">

        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

        @if(session('autherror'))
            mainmethods.createToast("{{ session('autherror') }}");
        @endif

      </script>
</html>
