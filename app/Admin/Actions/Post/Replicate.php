<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Replicate extends RowAction
{
    public $name = 'renew';

     public function handle(Model $model)
     {
         $model->replicate();
        
    }
    public function href()
    {
        return "/admin/form-sr4s/{$this->getKey()}/edit";
    }

}