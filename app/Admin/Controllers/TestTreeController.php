<?php

namespace App\Admin\Controllers;

use App\Models\SeedLab;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Layout\Content;
use Encore\Admin\Tree;

class TestTreeController extends AdminController
{
    protected $title = 'All categories';

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->title($this->title)
            ->body($this->tree());
    }

    /**
     * Make a grid builder.
     *
     * @return Tree
     */
    protected function tree()
    {
        return SeedLab::tree(function (Tree $tree) {

            $tree->branch(function ($branch) {
                //return "romina";
                $tree->dsia;

                $ord = $branch['id'];
                $lab = SeedLab::find($ord);
                if (!$lab) {
                    return $ord;
                }
                return $lab->mother_lot."";

                return ($branch['mother_lot']);

                $src = url("storage/" . $branch['logo']);

                $logo = "<img src='$src' style='max-width:30px;max-height:30px' class='img'/>";

                return '<a href="/love">' . "{$branch['id']} - {$branch['title']} $logo" . '</a>';
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SeedLab());

        $form->display('id', 'ID');

        $form->select('parent_id')->options(SeedLab::selectOptions());

        $form->text('title')->rules('required');

        //$form->image('logo');


        return $form;
    }
}
