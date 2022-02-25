<?php

namespace App\Admin\Actions\SubGrower;

use App\Models\Utils;
use Encore\Admin\Actions\BatchAction;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class BatchReplicate extends BatchAction
{
    public $name = 'Assign inspector';
    public function handle(Collection $collection, Request $request)
    {

        $inspect = ((int)($request->get('inspector')));
        if($inspect>0){
            foreach ($collection as $key => $val) {
                $val->status = 2;
                $val->inspector = $inspect;
                $val->save();
            }
        }

        return $this->response()->topCenter()->success("Assigned successfully." );//->refresh();
    }
/*

Encore\Admin\Actions\Response::success(): Argument #1 ($message) must be of type string, null given, called in /Applications/MAMP/htdocs/stts/app/Admin/Actions/SubGrower/BatchReplicate.php on line 18

*/
 

    public function form()
    {



        $items = Administrator::all();
        $_items = [];
        foreach ($items as $key => $item) {
            if (!Utils::has_role($item, "inspector")) {
                continue;
            }
            $_items[$item->id] = $item->name . " - " . $item->id;
        }
        $this->select('inspector', __('Inspector'))
            ->options($_items) 
            ->help('Please select inspector')
            ->required()
            ->rules('required');
        return $this->response()->success('Success message...')->refresh();
    }
}
