<x-page title="Register">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card register-card">
                <div class="card-body">
                    <form action="{{ route('register.post') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="username" class="form-label">İsim Soyisim</label>
                            <div class="input-group input-group-merge">
                                <input class="form-control" type="text" name="first_name" id="first_name" placeholder="İsim" value="{{ old('first_name') }}" required>
                                <input class="form-control" type="text" name="last_name" id="last_name" placeholder="Soyisim" value="{{ old('last_name') }}" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label">Kullanıcı Adı</label>
                            <input type="text" class="form-control" name="username" id="username" placeholder="Kullanıcı Adı" value="{{ old('username') }}" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">E-Posta</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="E-Posta" value="{{ old('email') }}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Telefon</label>
                            <input type="number" class="form-control" name="phone" id="phone" placeholder="Telefon 5xxxxxxxxx" value="{{ old('phone') }}" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Şifre</label>
                            <div class="input-group input-group-merge">
                                <input class="form-control" type="password" name="password" id="password" placeholder="Şifre" required>
                                <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" placeholder="Şifre Tekrar" required>
                            </div>
                        </div>
                        <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="kvkk" name="kvkk">
                                <label for="kvkk" class="form-check-label">KVKK Metnini Okudum, Anladım ve Onaylıyorum.</label>
                            </div>
                            <button class="btn btn-success text-light" type="submit">Üye Ol</button>
                            @if($errors->any())
                            @foreach($errors->all() as $error)
                            {{ $error }}
                            @endforeach
                            @endif
                            @if(session('error'))
                            {{ session('error') }}
                            @endif
                        </div>
                    </form>
                </div>
                <div class="card-footer" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                    Zaten üye misin? <a href="{{ route('login.view') }}" class="text-primary text-decoration-none">Giriş Yap</a>
                </div>
            </div>
        </div>
    </div>
</x-page>