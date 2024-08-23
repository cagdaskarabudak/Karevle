<x-page title="Profilim">
    <div class="col-lg-8 mx-auto">
        <div class="card profile-card">
            <div class="card-body">
                <form action="{{ route('update.post') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                <div class="user-profile-photo">
                    <label for="user-pp-input" class="user-pp-input-label">
                        <div class="first-words">
                            @if(!Auth::user()->avatar == null) 
                                <img src="{{ '/storage/'.Auth::user()->avatar }}" class="user-avatar-img" alt="User Avatar">
                            @else
                                    {{ mb_substr(Auth::user()->first_name, 0, 1) }}{{ mb_substr(Auth::user()->last_name, 0, 1) }}
                                
                            @endif
                        </div>
                        <div class="hover-div">
                            Avatarı Düzenle
                        </div>
                    </label>
                    <input id="user-pp-input" type="file" name="user_avatar" />
                </div>
                <div class="input-group input-group-merge col-lg-8 my-3">
                    <label class="input-group-text" for="first_name">İsim & Soyisim</label>
                    <input type="text" class="form-control" id="first_name" name="first_name" value="{{ Auth::user()->first_name }}">
                    <input type="text" class="form-control" id="last_name" name="last_name" value="{{ Auth::user()->last_name }}">
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Kullanıcı Adı</label>
                    <input type="text" class="form-control" id="username" name="username" value="{{ Auth::user()->username }}">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">E-Posta</label>
                    <input type="mail" id="email" name="email" class="form-control" value="{{ Auth::user()->email }}">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Telefon (+90)</label>
                    <input type="text" class="form-control" name="phone" id="phone" value="{{ Auth::user()->phone }}">
                </div>
                <div class="input-group input-group-merge mb-3">
                    <label for="old_password" class="input-group-text">Eski Şifre</label>
                    <input type="password" class="form-control" name="old_password" id="old_password">
                </div>
                <div class="input-group mb-3 input-group-merge">
                    <label for="password" class="input-group-text">Yeni Şifre & Yeni Şifre Tekrar</label>
                    <input type="password" class="form-control" id="password" name="password">
                    <input type="password" class="form-control" id="password_confirmation" name="password_confirmation">
                </div>
                <button class="btn btn-primary" type="submit">Güncelle</button>
            </form>
            @if($errors->any())
                @foreach($errors->all() as $error)
                    <span class="text-danger">{{ $error }}</span>
                @endforeach
            @endif
            @if(session('successes'))
                @foreach(session('successes') as $success)
                    <span class="text-success">{{ $success }}</span>
                @endforeach
            @endif
            </div>
        </div>
    </div>
</x-page>
<script type="module">
    let avatarUpdateInput = document.querySelector('#user-pp-input');
    avatarUpdateInput.addEventListener('change', function(event){
        const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          const img = document.createElement('img');
          img.src = e.target.result;
          let firstWords = document.querySelector('.first-words');
          firstWords.innerHTML = "";
          firstWords.appendChild(img);
        }
        reader.readAsDataURL(file);
      }
    });

    avatarUpdateInput.addEventListener('click', function(e){
        if(event.target.files.length > 0){
            let photoClearConfirm = confirm('Fotoğraf kaldırılsın mı?');
            if(!photoClearConfirm){
                e.preventDefault();
            }
        }
    });
</script>