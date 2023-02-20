<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Renew extends RowAction
{
    private $entity;
    //create constructor with parameter entity
    public function __construct($entity)
    {
        $this->entity = $entity;
    }
    public $name = 'renew';

     public function handle(Model $model)
     {
         $model->replicate();
        
    }
    public function href()
    {
        return "/admin/{$this->entity}/{$this->getKey()}/edit";
    }

}