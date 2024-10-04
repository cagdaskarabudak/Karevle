<script type="module">
    let payment_status = @json($payment_status);

    function getPaymentStatus(){
        return payment_status;
    }

    window.parent.postMessage(payment_status);
</script>