<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class ShoppingCartProductCard extends Component
{
    public $basket;

    public function __construct($basket)
    {
        $this->basket = $basket;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.shopping-cart-product-card');
    }
}
