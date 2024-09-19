<x-page title="Profilim">
    <x-account>
        <form action="{{ route('user.profile.post') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label for="user_avatar" class="user_avatar_label">
                    @if(Auth::user()->avatar != null) 
                    <img src="/storage/{{ Auth::user()->avatar }}" class="user_avatar_preview_img" alt="">
                    @else
                    <div class="text-avatar">{{ mb_substr(Auth::user()->first_name, 0, 1).mb_substr(Auth::user()->last_name, 0, 1) }}</div>
                    @endif
                    <div class="select-text">Yeni Görüntü Seç</div>
                </label>
                <input type="file" id="user_avatar" name="user_avatar">
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">İsim Soyisim</label>
                <div class="input-group input-group-merge">
                    <input class="form-control" type="text" name="first_name" id="first_name" placeholder="İsim" value="{{ Auth::user()->first_name }}" required>
                    <input class="form-control" type="text" name="last_name" id="last_name" placeholder="Soyisim" value="{{ Auth::user()->last_name }}" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Kullanıcı Adı</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Kullanıcı Adı" value="{{ Auth::user()->username }}" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">E-Posta</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="E-Posta" value="{{ Auth::user()->email }}" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Telefon</label>
                <input type="number" class="form-control" name="phone" id="phone" placeholder="Telefon 5xxxxxxxxx" value="{{ Auth::user()->phone }}" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Şifre Değişikliği</label>
                <input class="form-control mb-3" type="password" name="old_password" id="old_password" placeholder="Mevcut Şifre">
                <div class="input-group input-group-merge">
                    <input class="form-control" type="password" name="password" id="password" placeholder="Yeni Şifre">
                    <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" placeholder="Yeni Şifre Tekrar">
                </div>
            </div>
            <button class="btn btn-success text-light" type="submit">Kaydet</button>
            @if($errors->any())
            @foreach($errors->all() as $error)
             {{ $error }}
             @endforeach
            @endif
            @if(session('error'))
            {{ session('error') }}
            @endif
            @if(session('successes'))
            @foreach(session('successes') as $success)
            {{ $success }}
            @endforeach
            @endif
        </form>
    </x-account>
</x-page>