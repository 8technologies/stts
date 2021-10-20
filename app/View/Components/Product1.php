<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Product1 extends Component
{
   
    public function __construct($item)
    { 
        $this->item = $item;
    }
 
    public $item;

    public function render()
    {
        return view('components.product1');
    }
}
