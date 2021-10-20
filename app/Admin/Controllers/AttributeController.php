<?php

namespace App\Admin\Controllers;

use App\Models\Attribute;
use App\Models\category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AttributeController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Attribute';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Attribute());

        $grid->column('id', __('Id'));
        //$grid->column('created_at', __('Created at'));
        //$grid->column('updated_at', __('Updated at'));
        //$grid->column('category_id', __('Category'));

        $grid->category_id()->display(function ($category_id) {
            $cat = Category::find($category_id);
            if (!$cat) {
                return "-";
            }
            if (!isset($cat->name)) {
                return "-";
            }
            return $cat->name;
        });

        $grid->column('name', __('Name'));
        $grid->column('type', __('Type'));
        $grid->column('options', __('Options'));
        $grid->column('is_required', __('Is required'));

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
        $show = new Show(Attribute::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('category_id', __('Category id'));
        $show->field('name', __('Name'));
        $show->field('type', __('Type'));
        $show->field('options', __('Options'));
        $show->field('is_required', __('Is required'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Attribute());

        $items = Category::all();
        $cats = [];
        foreach ($items as $key => $item) {
            if ($item->parent < 1) {
                continue;
            }
            $cats[$item->id] = $item->name;
        }

        $form->select('category_id', 'Category')->options($cats)->required();

        $form->text('name', __('Name'))->rules('required');
        $options["text"] = "text";
        $options["textarea"] = "textarea";
        $options["number"] = "number";
        $options["select"] = "select";
        $options["radio"] = "radio";
        $options["checkbox"] = "checkbox";
        //$form->select('type')->options(['', 'text', 'textarea', 'number', 'select', 'radio', 'checkbox'])->rules('required');
        $form->select('type')->options($options)->rules('required');

        $form->tags('options', __('Options'));

        $form->text('units', __('Units'));
        $form->switch('is_required', __('Is required'));

        return $form;
    }
}
