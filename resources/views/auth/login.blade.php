<x-page title="Login">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card login-card">
                <div class="card-body">
                    <form action="{{ route('login.post') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="username" class="form-label">Kullanıcı Adı, Telefon, E-Posta</label>
                            <input class="form-control" type="text" name="username" id="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Şifre</label>
                            <input class="form-control" type="password" name="password" id="password" required>
                        </div>
                        <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                            <button class="btn btn-success text-light" type="submit">Giriş Yap</button>
                            <a href="#" class="text-primary text-decoration-none">Şifreni mi unuttun?</a>
                        </div>
                    </form>
                </div>
                <div class="card-footer" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                    Burada yeni misin? <a href="{{ route('register.view') }}" class="text-primary text-decoration-none">Üye Ol</a>
                </div>
            </div>
        </div>
    </div>
</x-page>