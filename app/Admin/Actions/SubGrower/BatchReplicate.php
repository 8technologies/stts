<?php

namespace App\Admin\Actions\SubGrower;

use App\Models\Utils;
use Encore\Admin\Actions\BatchAction;
use Encore\Admin\Admin;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class BatchReplicate extends BatchAction
{
    public $name = 'Assign inspector';
    public function handle(Collection $collection, Request $request)
    {

        $inspect = ((int)($request->get('inspector_id')));
        if($inspect>0){
            foreach ($collection as $key => $val) {
                $val->status = 2;
                $val->inspector_id = $inspect;
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
            $_items[$item->id] = $item->name.' - '. $item->district;
        }
        
        $this->select('inspector_id', __('Inspector'))
            ->options($_items)
            ->help('Please select inspector')
            ->required()
            ->rules('required');

        Admin::script('
            $(document).on("shown.bs.modal", ".modal", function() {
                setTimeout(function() {
                    const modalSelect = $(".modal select[name=inspector_id]");
                    
                    if (modalSelect.length > 0) {
                        if (modalSelect.hasClass("select2-hidden-accessible")) {
                            modalSelect.select2("destroy");
                        }
                        
                        modalSelect.select2({
                            allowClear: true,
                            placeholder: "Type to search inspector...",
                            minimumInputLength: 0,
                            minimumResultsForSearch: 0,
                            width: "100%",
                            dropdownParent: $(".modal")
                        });
                        
                        modalSelect.select2("open");
                        
                        setTimeout(function() {
                            $(".modal .select2-search__field").focus();
                        }, 100);
                    }
                }, 200);
            });
        ');

        return $this->response()->success('Success message...')->refresh();

    }
}
