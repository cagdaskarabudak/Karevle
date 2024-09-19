/*

width <= 575            : xs
576 <= width <= 767     : sm
768 <= width <= 991     : md
992 <= width <= 1199    : lg
1200 <= width <= 1399   : xl
1400 <= width           : xxl

*/

document.addEventListener('DOMContentLoaded', async function(){

    menuFixedToggler();

    let menuitemIcon = document.querySelectorAll('a.menu-item.active i');
    if(menuitemIcon){
        menuitemIcon.forEach(icon => {
            icon.classList.remove('fa-regular');
            icon.classList.add('fa-solid');
        });
    }

    let menuDropdowns = document.querySelectorAll('.dropdown');
    menuDropdowns.forEach(menuDropdown => {
        menuDropdown.addEventListener('show.bs.dropdown', function(){
            let menuDropdownIcon = menuDropdown.querySelector('a svg');
            menuDropdownIcon.setAttribute('data-prefix', 'fas');
        });
        menuDropdown.addEventListener('hide.bs.dropdown', function(){
            if(!menuDropdown.querySelector('a').classList.contains('active')){
                let menuDropdownIcon = menuDropdown.querySelector('a svg');
                menuDropdownIcon.setAttribute('data-prefix', 'far');
            }
        });
    });

    let menuOffcanvas = document.querySelectorAll('.menu-item');
    menuOffcanvas.forEach(menuOC => {
        menuOC.addEventListener('show.bs.offcanvas', function(){
            let button = document.querySelector('[href="#'+ menuOC.id +'"]');
            let buttonIcon = button.querySelector('svg');
            buttonIcon.setAttribute('data-prefix', 'fas');
        });
        menuOC.addEventListener('hide.bs.offcanvas', function(){
            if(!menuOC.classList.contains('active')){
                let button = document.querySelector('[href="#'+ menuOC.id +'"]');
                if(!button.classList.contains('active')){
                    let buttonIcon = button.querySelector('svg');
                    buttonIcon.setAttribute('data-prefix', 'far');
                }
            }
        });
    });


});

window.addEventListener('scroll', menuFixedToggler);

function menuFixedToggler(){
    const scrollPosition = window.scrollY || document.documentElement.scrollTop;
    let navdiv = document.querySelector('.nav-div');
    if(scrollPosition > 10 && window.innerWidth >= 1200){
        navdiv.classList.add('fixed-nav-div');
    }
    else{
        navdiv.classList.remove('fixed-nav-div');
    }
}

import './all_categories';