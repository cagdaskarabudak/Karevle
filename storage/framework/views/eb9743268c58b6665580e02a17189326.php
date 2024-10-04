<script type="module">
    let payment_status = <?php echo json_encode($payment_status, 15, 512) ?>;

    function getPaymentStatus(){
        return payment_status;
    }

    window.parent.postMessage(payment_status);
</script><?php /**PATH /Users/cagdaskarabudak/Desktop/Projects/E-Commerce/KarevleLaravel/resources/views/shopping-cart/shopping-cart-payment-status.blade.php ENDPATH**/ ?>