<?php

namespace App\Models;
use Illuminate\Support\Facades\DB;
 
echo "<pre>";
$p = Category::find(1);
print_r(json_decode(json_encode($p->attributes)) );
echo "<hr>";

 