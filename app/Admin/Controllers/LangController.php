<?php

namespace App\Admin\Controllers;

use App\Models\Lang;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LangController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Lang';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {  

 
        $grid = new Grid(new Lang());
        $grid->disableBatchActions();
        $grid->quickSearch('en')->placeholder('Seach by english');
        $grid->model()->orderby('key', 'asc');
        $grid->column('key', __('Key'))->sortable();
        $grid->column('en', __('En'))->sortable()->editable();
        $grid->column('fr', __('Fr'))->sortable()->editable();

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
        $show = new Show(Lang::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('key', __('Key'));
        $show->field('en', __('En'));
        $show->field('fr', __('Fr'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Lang());

        $form->text('key', __('Key'))->required();
        $form->text('en', __('En'))->required();
        $form->text('fr', __('Fr'));
        $form->disableReset();

        return $form;
    }
}
