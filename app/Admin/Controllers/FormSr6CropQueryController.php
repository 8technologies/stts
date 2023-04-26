<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Crop;
use Illuminate\Http\Request;


class FormSr6CropQueryController extends Controller
{
    public function crops(Request $request)
    {
        $q = $request->get('q');
        return Crop::where('name', 'like', "%$q%")->paginate(null, ['id', 'name as text']);
    }
}
