
document.addEventListener('DOMContentLoaded', function(){
    let user_avatar_input = document.querySelector('input#user_avatar');
    if(user_avatar_input){
        user_avatar_input.addEventListener('change', function(event){
            const file = event.target.files[0];
        
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    let user_avatar_preview_img = document.querySelector('.user_avatar_preview_img');
                    if(user_avatar_preview_img){
                        document.querySelector('.user_avatar_preview_img').src = e.target.result;
                    }
                    else{
                        let user_text_avatar = document.querySelector('label.user_avatar_label .text-avatar');
                        user_text_avatar.remove();
                        let newimgelement = document.createElement('img');
                        newimgelement.classList.add('user_avatar_preview_img');
                        newimgelement.src = e.target.result;
                        document.querySelector('label.user_avatar_label').append(newimgelement);
                    }
                }
                reader.readAsDataURL(file);
            }
        
        });
    }

});
