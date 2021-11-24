<?php

namespace App\Models;

use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestTree extends Model
{
 

    use ModelTree, AdminBuilder;

    protected $table = 'test_trees';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        // $this->setParentColumn('pid');
        // $this->setOrderColumn('sort');
        // $this->setTitleColumn('name');
    }
}
