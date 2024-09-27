


let addressDeleteButtons = document.querySelectorAll('.address-delete-btn');

if(addressDeleteButtons)[
    addressDeleteButtons.forEach(addressDeleteButton => {
        addressDeleteButton.addEventListener('click', async function(){
            let addressid = addressDeleteButton.getAttribute('data-id');
            let addressdiv = addressDeleteButton.parentElement.parentElement;
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
            Swal.fire({
                title: 'Emin Misiniz?',
                text: 'Adresi silmek isteidiğinize emin misiniz?',
                icon: 'question',
                confirmButtonText: 'Sil',
                showCancelButton: true,
                cancelButtonText: 'Vazgeç'
              }).then(async res => {
                if(res.isConfirmed){
                    try {
                        const response = await axios.post('/deleteAddress', {
                            addressid: addressid
                        });
                        if(response.data == true){
                            Swal.fire({
                                title: 'Başarılı!',
                                text: 'Adres başarıyla silindi.',
                                icon: 'success',
                                confirmButtonText: 'Tamam'
                              }).then(res => {
                                if(res.isConfirmed){
                                    $(addressdiv).hide(500);
                                }
                              });
                        }
                    } catch (error) {
                        console.error('Error:', error);
                        throw error;
                    }
                }
                else {
                    return false;
                }
              });
        

        });
    })
]

let addressDefaultButtons = document.querySelectorAll('.address-default-btn');

if(addressDefaultButtons){
    addressDefaultButtons.forEach(addressDefaultButton => {
        addressDefaultButton.addEventListener('click', async function(){
            let addressid = addressDefaultButton.getAttribute('data-id');
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
                    try {
                        const response = await axios.post('/defaultAddress', {
                            addressid: addressid
                        });
                        if(response.data == true){
                            window.location.reload();
                        }
                    } catch (error) {
                        console.error('Error:', error);
                        throw error;
                    }
        });
    })
}