<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CropVariety;
use App\Models\FormStockExaminationRequest;
use App\Models\SeedLab;
use App\Models\FormQds;
use App\Models\StockRecord;
use App\Models\TestTree;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Tree;
use Encore\Admin\Widgets\Tab;
use Encore\Admin\Widgets\Table;


class TrackAndTraceController extends AdminController
{
    
    /** 
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Track and Trace Analysis';

    /**
     * Make a grid builder.
     *
     * @return Grid 
     */
    protected function grid()
    {

        $grid = new Grid(new SeedLab());        
        $grid->column('id', __('Id'));
        $grid->column('lot_number', __('Lot number'))->badge($style = 'blue')->copyable();
        $grid->column('mother_lot', __('Mother lot'))->badge($style = 'green')->copyable();     

        $grid->filter(function($search_param){
            $search_param->disableIdfilter();
            $search_param->like('lot_number', __("Search by Lot number"));
            $search_param->like('mother_lot', __("Search by Mother Lot"));
        });

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
        /***
         * 
         * The details should show the company name, the crop variety, year, original quantity
         */
        $show = new Show(SeedLab::findOrFail($id));
        // $show = new Show(FormQds::findOrFail($id));
        // $show = new Show(FormStockExaminationRequest::findOrFail($id));
        
        // $show->panel()
        //     ->tools(function ($tools) {
        //         $tools->disableEdit();
        //         $tools->disableDelete();
        //     });;

        $show->field('id', __('Id'));
        $show->field('lot_number', __('Lot number'))->badge($style = 'blue');
        $show->field('mother_lot', __('Mother lot'))->badge($style = 'green');
        // $show_qds->field('dddddddddd', __('Company Name'));
        // $show->field('dddddddddd', __('Crop Variety'));
        $show->field('years_of_expirience', __('Years of Experience'));
        // $show->field('dddddddddd', __('Original Quantity'));


        return $show;
        // return [$show, $show_qds];
    }




    protected function form()
    {
        $form = new Form(new SeedLab());

        $form->display('id', 'ID');

        $form->select('parent_id')->options(SeedLab::selectOptions());

        $form->text('mother_lot')->rules('required');

        //$form->image('logo');


        return $form;
    }
}
