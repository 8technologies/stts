<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\URL;

class CategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'category';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Category());

        $grid->column('id', __('Id'));
        //$grid->column('created_at', __('Created at'));
        //$grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name')); 
        $grid->parent()->display(function($category_id) {
            $cat = Category::find($category_id);
            if(!$cat){
                return "-";
            }
            if(!isset($cat->name)){
                return "-";
            }
            return $cat->name;
        });
        
        $grid->image()->display(function($src) {
            $src =  URL::asset('storage')."/".$src;
            return '<img width="20" src="'.$src.'" alt="'.$src.'">';
        });
        
        //$grid->column('description', __('Description'));
        //$grid->column('slug', __('Slug'));
        //$grid->column('image', __('Image'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Category::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('parent', __('Parent'));
        $show->field('name', __('Name'));
        $show->field('description', __('Description'));
        $show->field('slug', __('Slug'));
        $show->field('image', __('Image'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Category());

        $items = Category::all();
        $cats = [];
        $cats[0] = "No parent category";
        foreach ($items as $key => $item) {
            if($item->parent>0){
                continue;
            }
            $cats[$item->id] = $item->name;
        }

        $form->select('parent', 'Parent category')->options($cats)->required();

         
        $form->text('name', __('Name'));
        $form->textarea('description', __('Description'))->required();
        //$form->text('slug', __('Slug'))->required();
        $form->image('image', __('Image'))->required();

        return $form;
    }
}
