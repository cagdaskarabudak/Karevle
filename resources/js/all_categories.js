
    let menuItems = document.querySelectorAll('.menu-item a');
    menuItems.forEach(menuItem => {
        menuItem.addEventListener('click', function(){
            let menuSub = menuItem.parentElement.querySelector('.menu-sub');
            let chevronIcon = menuItem.querySelector('svg');
            $(menuSub).slideToggle(300);
            $(this.parentElement).toggleClass('open');
            if(chevronIcon){
                if(chevronIcon.classList.contains('fa-chevron-right')){
                    $(chevronIcon).switchClass('fa-chevron-right', 'fa-chevron-down', 300);
                }
                else{
                    $(chevronIcon).switchClass('fa-chevron-down', 'fa-chevron-right', 300);
                }
            }
        });

    });