<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class ShoppingCartConfirm extends Component
{
    public $baskets;
    public $address;
    public $iaddress;
    public function __construct($baskets, $address = null, $iaddress = null)
    {
        $this->baskets = $baskets;
        $this->address = $address;
        $this->iaddress = $iaddress;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.shopping-cart-confirm');
    }
}
