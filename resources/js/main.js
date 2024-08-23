class MainMethods{
    createToast(message) {
        let toastContainer = document.querySelector('.toast-container');
        let liveToast = document.createElement('div');
        liveToast.className = 'toast';
        liveToast.setAttribute('role', 'alert');
        liveToast.setAttribute('aria-live', 'assertive');
        liveToast.setAttribute('aria-atomic', 'true');
        
        let toastHeader = document.createElement('div');
        toastHeader.className = 'toast-header';
        toastHeader.innerHTML = `
            <img src="/storage/main_images/favicon.svg" class="rounded me-2" alt="Logo" width="25px">
            <strong class="me-auto">Karevle</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>`;
        let toastBody = document.createElement('div');
        toastBody.className = 'toast-body';
        liveToast.appendChild(toastHeader);
        liveToast.appendChild(toastBody);
        toastBody.innerHTML = message;
        toastContainer.appendChild(liveToast);
        let toastBootstrap = bootstrap.Toast.getOrCreateInstance(liveToast);
        toastBootstrap.show();
    }

    mobileAppNotf(){
        document.querySelector('.mobile-app-notf').style.display = 'block';
    }
}

export default MainMethods;