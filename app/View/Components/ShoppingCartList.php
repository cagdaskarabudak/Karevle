<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class ShoppingCartList extends Component
{
    
    public $baskets;
    public function __construct($baskets)
    {
        $this->baskets = $baskets;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.shopping-cart-list');
    }
}
