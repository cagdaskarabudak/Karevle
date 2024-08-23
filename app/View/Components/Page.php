<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Models\Category;

class Page extends Component
{
    public string $title;
    public $categories;

    public function __construct(string $title) {
        $this->title = $title;

        $this->categories = Category::where('parent_category_id', '=', null)->get();
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.page');
    }
}
