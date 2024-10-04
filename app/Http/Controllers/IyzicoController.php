<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;
use Iyzipay\Options;
use Iyzipay\Model\BasketItem;
use Iyzipay\Model\BasketItemType;
use Iyzipay\Model\Buyer;
use Iyzipay\Model\PaymentCard;
use Iyzipay\Model\Address;
use Iyzipay\Request\CreatePaymentRequest;
use Iyzipay\Request\CreateThreedsPaymentRequest;
use Iyzipay\Model\Currency;
use Iyzipay\Model\Payment;
use Iyzipay\Model\ThreedsPayment;
use Iyzipay\Model\PaymentGroup;
USE Iyzipay\Model\ThreedsInitialize;
use App\Models\Shoppingcart;
use App\Models\Cargo;
use App\Models\Order;
use Carbon\Carbon;

class IyzicoController extends Controller
{
    public static function payment($order, $card){

        $API_KEY = env('IYZICO_API_KEY');
        $API_SECRET = env('IYZICO_API_SECRET');
        $BASE_URL = env('IYZICO_BASE_URL');

        $options = new Options();
        $options->setApiKey($API_KEY);
        $options->setSecretKey($API_SECRET);
        $options->setBaseUrl($BASE_URL);

        // Ödeme isteği oluşturma
        $request = new CreatePaymentRequest();
        $request->setLocale("tr");
        $request->setConversationId("123456789");
        $request->setPrice(number_format(($order->coupon ? $order->coupon->coupon_amount + $order->total_price : $order->total_price), 2, '.', '')); // Ürün toplam fiyatı
        $request->setPaidPrice(number_format($order->total_price, 2, '.', '')); // Toplam ödenecek tutar (vergi, kargo vb. dahil)
        $request->setCurrency(Currency::TL);
        $request->setInstallment(1); // Taksit sayısı
        $request->setBasketId($order->id);
        $request->setPaymentChannel("WEB");
        $request->setPaymentGroup(PaymentGroup::PRODUCT);

        // Ödeme Kartı Bilgileri
        $paymentCard = new PaymentCard();
        $paymentCard->setCardHolderName($card['user']);
        $paymentCard->setCardNumber($card['number']);
        $paymentCard->setExpireMonth($card['month']);
        $paymentCard->setExpireYear($card['year']);
        $paymentCard->setCvc($card['cvc']);
        $paymentCard->setRegisterCard(0);
        $request->setPaymentCard($paymentCard);

        // Alıcı Bilgileri
        $buyer = new Buyer();
        $buyer->setId($order->user_id == null ? 0 : $order->user_id);
        $buyer->setName($order->user_id == null ? $order->invoice_address->first_name : $order->user->first_name);
        $buyer->setSurname($order->user_id == null ? $order->invoice_address->last_name : $order->user->last_name);
        $buyer->setGsmNumber($order->user_id == null ? $order->invoice_address->phone : $order->user->phone);
        $buyer->setEmail($order->user_id == null ? $order->invoice_address->email : $order->user->email);
        $buyer->setIdentityNumber("00000000000");
        $buyer->setRegistrationAddress("Turkey");
        $buyer->setCity("Istanbul");
        $buyer->setCountry("Turkey");
        $buyer->setZipCode("34340");
        $request->setBuyer($buyer);

        // Kargo Adresi
        $delivery_address = $order->address;
        $shippingAddress = new Address();
        $shippingAddress->setContactName($delivery_address->first_name.' '.$delivery_address->last_name);
        $shippingAddress->setCity($delivery_address->city);
        $shippingAddress->setCountry($delivery_address->country);
        $shippingAddress->setAddress($delivery_address->address);
        $shippingAddress->setZipCode($delivery_address->postal_code);
        $request->setShippingAddress($shippingAddress);
    
        // Fatura Adresi
        $invoice_address = $order->invoice_address;
        $billingAddress = new Address();
        $billingAddress->setContactName($invoice_address->first_name.' '.$invoice_address->last_name);
        $billingAddress->setCity($invoice_address->city);
        $billingAddress->setCountry($invoice_address->country);
        $billingAddress->setAddress($invoice_address->address);
        $billingAddress->setZipCode($invoice_address->postal_code);
        $request->setBillingAddress($billingAddress);

        // Sepet Ürünleri
        $basketItems = [];
        foreach($order->baskets as $basket){
                $basketItem = new BasketItem();
                $basketItem->setId($basket->product->id);
                $basketItem->setName($basket->product->name);
                $basketItem->setCategory1($basket->product->category->name);
                $basketItem->setItemType(BasketItemType::PHYSICAL);
                $basketItem->setPrice(number_format($basket->count * $basket->price, 2, '.', ''));
                $basketItems[] = $basketItem;
        }
        $cargoItem = new BasketItem();
        $cargoItem->setId($order->cargo->id);
        $cargoItem->setName("Kargo Ücreti");
        $cargoItem->setCategory1("Karevle Lojistik");
        $cargoItem->setItemType(BasketItemType::PHYSICAL);
        $cargoItem->setPrice(number_format($order->cargo->price, 2, '.', ''));
        $basketItems[] = $cargoItem;

        $request->setBasketItems($basketItems);

        // Ödeme İşlemi Başlatma
        $payment = Payment::create($request, $options);

        if ($payment->getStatus() == 'success') {
            $orderStatusUpdateTransaction = OrderController::status_update($order->id, 3);
            $payment_status = [
                'status' => 'success',
                'order_id' => $order->id,
            ];

            return response()->json($payment_status);
        } else {
            $orderStatusUpdateTransaction = OrderController::status_update($order->id, 11);
            $payment_status = [
                'status' => 'fail',
                'error_code' => $payment->getErrorCode(),
                'error_message' => $payment->getErrorMessage()
            ];
            return response()->json($payment_status);
        }

    }

    public static function paymentWith3DSecure($order, $card){
        Cache::put('order_id', $order->id);

        $API_KEY = env('IYZICO_API_KEY');
        $API_SECRET = env('IYZICO_API_SECRET');
        $BASE_URL = env('IYZICO_BASE_URL');
    
        $options = new Options();
        $options->setApiKey($API_KEY);
        $options->setSecretKey($API_SECRET);
        $options->setBaseUrl($BASE_URL);
    
        // 3D Secure ödeme isteği oluşturma
        $request = new CreatePaymentRequest();
        $request->setLocale("tr");
        $request->setConversationId("123456789");
        $request->setPrice(number_format(($order->coupon ? $order->coupon->coupon_amount + $order->total_price : $order->total_price), 2, '.', ''));
        $request->setPaidPrice(number_format($order->total_price, 2, '.', ''));
        $request->setCurrency(Currency::TL);
        $request->setInstallment(1);
        $request->setBasketId($order->id);
        $request->setPaymentChannel("WEB");
        $request->setPaymentGroup(PaymentGroup::PRODUCT);
    
        // Ödeme Kartı Bilgileri
        $paymentCard = new PaymentCard();
        $paymentCard->setCardHolderName($card['user']);
        $paymentCard->setCardNumber($card['number']);
        $paymentCard->setExpireMonth($card['month']);
        $paymentCard->setExpireYear($card['year']);
        $paymentCard->setCvc($card['cvc']);
        $paymentCard->setRegisterCard(0);
        $request->setPaymentCard($paymentCard);
    
        // Alıcı Bilgileri
        $buyer = new Buyer();
        $buyer->setId($order->user_id == null ? 0 : $order->user_id);
        $buyer->setName($order->user_id == null ? $order->invoice_address->first_name : $order->user->first_name);
        $buyer->setSurname($order->user_id == null ? $order->invoice_address->last_name : $order->user->last_name);
        $buyer->setGsmNumber($order->user_id == null ? $order->invoice_address->phone : $order->user->phone);
        $buyer->setEmail($order->user_id == null ? $order->invoice_address->email : $order->user->email);
        $buyer->setIdentityNumber("00000000000");
        $buyer->setRegistrationAddress("Turkey");
        $buyer->setCity("Istanbul");
        $buyer->setCountry("Turkey");
        $buyer->setZipCode("34340");
        $request->setBuyer($buyer);
    
        // Kargo Adresi
        $delivery_address = $order->address;
        $shippingAddress = new Address();
        $shippingAddress->setContactName($delivery_address->first_name.' '.$delivery_address->last_name);
        $shippingAddress->setCity($delivery_address->city);
        $shippingAddress->setCountry($delivery_address->country);
        $shippingAddress->setAddress($delivery_address->address);
        $shippingAddress->setZipCode($delivery_address->postal_code);
        $request->setShippingAddress($shippingAddress);
    
        // Fatura Adresi
        $invoice_address = $order->invoice_address;
        $billingAddress = new Address();
        $billingAddress->setContactName($invoice_address->first_name.' '.$invoice_address->last_name);
        $billingAddress->setCity($invoice_address->city);
        $billingAddress->setCountry($invoice_address->country);
        $billingAddress->setAddress($invoice_address->address);
        $billingAddress->setZipCode($invoice_address->postal_code);
        $request->setBillingAddress($billingAddress);
    
        // Sepet Ürünleri
        $basketItems = [];
        foreach($order->baskets as $basket){
                $basketItem = new BasketItem();
                $basketItem->setId($basket->product->id);
                $basketItem->setName($basket->product->name);
                $basketItem->setCategory1($basket->product->category->name);
                $basketItem->setItemType(BasketItemType::PHYSICAL);
                $basketItem->setPrice(number_format($basket->count * $basket->price, 2, '.', ''));
                $basketItems[] = $basketItem;
        }
    
        $cargoItem = new BasketItem();
        $cargoItem->setId($order->cargo->id);
        $cargoItem->setName("Kargo Ücreti");
        $cargoItem->setCategory1("Karevle Lojistik");
        $cargoItem->setItemType(BasketItemType::PHYSICAL);
        $cargoItem->setPrice(number_format($order->cargo->price, 2, '.', ''));
        $basketItems[] = $cargoItem;
    
        $request->setBasketItems($basketItems);
    
        // 3D Secure ayarları
        $request->setCallbackUrl(env('APP_URL')."/sepetim/odeme/3Donay"); // 3D işlemi sonrası yönlendirilecek URL
    
        // Ödeme İşlemi Başlatma
        $payment = ThreedsInitialize::create($request, $options);
    
        // Başarılı işlem sonrası redirect
        if ($payment->getStatus() == 'success') {
            return response()->json([
                'status' => 'page',
                'html' => $payment->getHtmlContent()
            ]);
        } else {
            $payment_status = [
                'status' => 'fail',
                'error_code' => $payment->getErrorCode(),
                'error_message' => $payment->getErrorMessage()
            ];
            return response()->json($payment_status);
        }
    
    }

    public static function complete3DSecurePayment(Request $req) {
        $API_KEY = env('IYZICO_API_KEY');
        $API_SECRET = env('IYZICO_API_SECRET');
        $BASE_URL = env('IYZICO_BASE_URL');
    
        $options = new Options();
        $options->setApiKey($API_KEY);
        $options->setSecretKey($API_SECRET);
        $options->setBaseUrl($BASE_URL);
    
        $request = new CreateThreedsPaymentRequest();
        $request->setLocale("tr");
        $request->setConversationId("123456789");
        $request->setPaymentId($req->paymentId);
    
        $payment = ThreedsPayment::create($request, $options);
    
        if ($payment->getStatus() == 'success') {
            $orderid = Cache::get('order_id');
            $orderStatusUpdateTransaction = OrderController::status_update($orderid, 3);
            Cache::forget('order_id');
            $payment_status = [
                'status' => 'success',
                'order_id' => $orderid,
            ];

            return view('shopping-cart.shopping-cart-payment-status', compact('payment_status'));
        } else {
            $orderid = Cache::get('order_id');
            $orderStatusUpdateTransaction = OrderController::status_update($orderid, 11);
            Cache::forget('order_id');
            $payment_status = [
                'status' => 'fail',
                'error_code' => $payment->getErrorCode(),
                'error_message' => $payment->getErrorMessage()
            ];
            return view('shopping-cart.shopping-cart-payment-status', compact('payment_status'));
        }
    }
    
    
}
