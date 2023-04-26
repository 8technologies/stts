<?php

namespace App\Models;

use Hamcrest\Arrays\IsArray;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Zebra_Image;
use Encore\Admin\Facades\Admin;

class Utils
{

    public static function create_default_tables()
    {
        $crop = Crop::find(1);
        if ($crop == null) {
            $cro = new Crop();
            $cro->name = "Default crop";
            $cro->number_of_inspection = 0;
            $cro->crop_id = 1;
            $cro->number_of_days_before_submision = 0;
            $cro->save();
        }

        $var = CropVariety::find(1);
        if ($var == null) {
            $var = new CropVariety();
            $var->name = "Default crop variety";
            $var->id = 1;
            $var->crop_id = 1;
            $var->save();
        }
    }

    public static function get_stock_balance($user_id, $crop_id){
        $records = FormStockExaminationRequest::where([
            'administrator_id' => $user_id,
            'import_export_permit_id' => $crop_id
        ])->get();
        $tot = 0;
        foreach ($records as $key => $value) {
            $tot += $value->quantity;
        }
        return $tot;
    }


    public static function sr10_inialized(SubGrower $sr10)
    {
        if (!$sr10) {
            return false;
        }
        $forms = FormSr10::where('planting_return_id', $sr10->id)->get();
        if (count($forms) < 1) {
            return false;
        } else {
            return true;
        }
    }


    public static function start_session()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }


    public static function has_valid_sr6()
    {
        $recs = FormSr6::where('administrator_id',  Admin::user()->id)->get();
        foreach ($recs as $key => $value) {
            if (!$value->valid_from) {
                return null;
            }
            if (!$value->valid_until) {
                return null;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return $value;
            }
        }
        return null;
    }

    public static function has_valid_sr4()
    {
        $recs = FormSr4::where('administrator_id',  Admin::user()->id)->get();
        foreach ($recs as $key => $value) {
            if (!$value->valid_from) {
                return null;
            }
            if (!$value->valid_until) {
                return null;
            }
            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return $value;
            }
        }
        return null;
    }


    // public static function has_valid_qds()
    // {
    //     $recs = FormQds::where('administrator_id',  Admin::user()->id)->get();
    //     foreach ($recs as $key => $value) {
    //         if (!$value->valid_from) {
    //             return null;
    //         }
    //         if (!$value->valid_until) {
    //             return null;
    //         }
    //         $now = time();
    //         $then = strtotime($value->valid_until);
    //         if ($now < $then) {
    //             return $value;
    //         }
    //     }
    //     return null;
    // }


    public static function has_role($item, $role)
    {
        $roles = $item->roles()->get();
        foreach ($roles as $r) {
            if ($r->slug == $role) {
                return true;
            }
        }
        return false;
    }

    public static function can_create_qds()
    {
        $recs = FormQds::where('administrator_id',  Admin::user()->id)->get();
        foreach ($recs as $key => $value) {

            if ($value->status == 4) {
                continue;
            }

            if (!$value->valid_from) {
                return false;
            }
            if (!$value->valid_until) {
                return false;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }

    public static function can_create_qds_declaration()
    {
        $recs = FormCropDeclaration::where('administrator_id',  Admin::user()->id)->get();
        foreach ($recs as $key => $value) {

            if ($value->status == 4) {
                continue;
            }

            if (!$value->valid_from) {
                return false;
            }
            if (!$value->valid_until) {
                return false;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }

    // public static function can_create_export_form_old()
    // {
    //     $recs = ImportExportPermit::where('administrator_id',  Admin::user()->id)->get();
    //     foreach ($recs as $key => $value) {
    //         if ($value->is_import) {
    //             continue;
    //         }

    //         if ($value->status == 4) {
    //             continue;
    //         }

    //         if (!$value->valid_from) {
    //             return false;
    //         }
    //         if (!$value->valid_until) {
    //             return false;
    //         }

    //         $now = time();
    //         $then = strtotime($value->valid_until);
    //         if ($now < $then) {
    //             return true;
    //         } else {
    //             return false;
    //         }
    //     }

    //     return true;
    // }


    
    public static function can_create_import_form()
    {
        $recs = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        ->where('is_import', '=', 1)
        ->get();

        foreach ($recs as $key => $value) {

            if ($value->status == 4) {
                continue;
            }

            if (!$value->valid_from) {
                return false;
            }
            if (!$value->valid_until) {
                return false;
            }

            $now = time();   // today
            $then = strtotime($value->valid_until);  // expiry date

            if ($now < $then) {
                return true;   // valid
            } else {
                return false;   // not expired
            }
        }

        $recs_sr4 = FormSr4::where('administrator_id',  Admin::user()->id)->first();
        
        // if ($recs_sr4 &&count($recs_sr4) == 0) {    // if no sr4 belongs to current user
        if (!isset($recs_sr4)) {    // if no sr4 belongs to current user
            return false;
        }
        // $fffffff = FormSr4::where('administrator_id',  Admin::user()->id)->first();
        // if (isset($fffffff->status)) {    // if no sr4 belongs to current user
        
            foreach ($recs_sr4 as $key => $value_sr4) {
                if (!($value_sr4->status == 5)) {
                    return false;
                }
            }
        // }
        // else{
        //     return false;
        // }

        return true;
    }


    public static function can_create_export_form()
    {
        $recs = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        ->where('is_import', '!=', 1)
        ->get();
        
        foreach ($recs as $key => $value) {

            if ($value->status == 4) {  // if rejected, you cant apply again
                continue;
            }

            if (!$value->valid_from) {
                return false;
            }
            
            if (!$value->valid_until) {
                return false;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return true;
            } else {
                return false;
            }
        }

        $recs_sr4 = FormSr4::where('administrator_id',  Admin::user()->id)->first();
        
        // if (count($recs_sr4) == 0) {    // if no sr4 belongs to current user
        if (!isset($recs_sr4)) {    // if no sr4 belongs to current user

            return false;
        }
        
        foreach ($recs_sr4 as $key => $value_sr4) {
            if (!($value_sr4->status == 5)) {
                return false;
            }
        }

        return true;
    }





/*
    public static function can_create_export_form_old()
    {
        
        // $recs2 = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        // ->whereNull('is_import');

        // $recs = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        // ->where('is_import', '!=', 1)
        // ->union($recs2)
        // ->get();
        


        $recs = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        ->where('is_import', '!=', 1)
        ->get();

        foreach ($recs as $key => $value) {

            if (!$value->status == 4) {
                continue;
            }

            if (!$value->valid_from) {
                return false;
            }
            if (!$value->valid_until) {
                return false;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return true;
            } else {
                return false;
            }
        }

        $recs_sr4 = FormSr4::where('administrator_id',  Admin::user()->id)->get();
        
        if (count($recs_sr4) == 0) {    // if no sr4 belongs to current user
            return false;
        }
        
        foreach ($recs_sr4 as $key => $value_sr4) {
            if (!($value_sr4->status == 5)) {   // if sr4 is not accepted
                return false;
            }
        }

        return true;
    }

    */



    public static function previous_import_form_not_accepted()
    {
        $recs = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        ->where('is_import', '=', 1)
        ->get();

        foreach ($recs as $key => $value) {
            if ($value->status != 5) {   // if status is not 'Accepted'
                return false;
            }
        }

        return true;
    }



    public static function previous_export_form_not_accepted()
    {
        $recs = ImportExportPermit::where('administrator_id', '=',  Admin::user()->id)
        ->where('is_import', '!=', 1)
        ->get();

        foreach ($recs as $key => $value) {
            if ($value->status != 5) {
                return false;
            }
        }

        return true;
    }

    

    public static function can_create_sr6()
    {
        $recs = FormSr6::where('administrator_id',  Admin::user()->id)->get();
        foreach ($recs as $key => $value) {

            if ($value->status == 4) {
                continue;
            }

            if (!$value->valid_from) {
                return false;
            }
            if (!$value->valid_until) {
                return false;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }

    public static function can_create_sr4()
    {
        $recs = FormSr4::where('administrator_id',  Admin::user()->id)->get();
        
        // if (count($recs) == 0) {    // if no sr4 belongs to current user
        //     return false;
        // }
        // // dd(count($recs));

        foreach ($recs as $key => $value) {

            if (!$value->valid_from) {
                return false;
            }
            if (!$value->valid_until) {
                return false;
            }

            $now = time();
            $then = strtotime($value->valid_until);
            if ($now < $then) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }



    public static function tell_order_status($status)
    {
        if (!$status)
            return '<span class="badge badge-warning">Pending</span>';
        if ($status == 1)
            return '<span class="badge badge-warning">Pending</span>';
        if ($status == 2)
            return '<span class="badge badge-warning">Shipping</span>';
        if ($status == 3)
            return '<span class="badge badge-success">Completed</span>';
        if ($status == 4)
            return '<span class="badge badge-danger">Canceled</span>';
        if ($status == 5)
            return '<span class="badge badge-warning">Processing</span>';
    }

    public static function tell_status($status)
    {
        if (!$status)
            return '<span class="badge badge-warning">Pending</span>';
        if ($status == 1)
            return '<span class="badge badge-warning">Pending</span>';
        if ($status == 2)
            return '<span class="badge badge-warning">Inspection assigned</span>';
        if ($status == 3)
            return '<span class="badge badge-warning">Halted</span>';
        if ($status == 4)
            return '<span class="badge badge-danger">Rejected</span>';
        if ($status == 5)
            return '<span class="badge badge-success">Accepted</span>';
        if ($status == 6)
            return '<span class="badge badge-danger">Expired</span>';
        if ($status == 7)
            return '<span class="badge badge-warning">Provisional</span>';
        if ($status == 8)
            return '<span class="badge badge-warning">Used</span>';
        if ($status == 9)
            return '<span class="badge badge-warning">Lab inspection</span>';
        if ($status == 10)
            return '<span class="badge badge-warning">Lab test pending</span>';
        if ($status == 11)
            return '<span class="badge badge-success">Marketable</span>';
        if ($status == 12)
            return '<span class="badge badge-danger">Not Marketable</span>';
        if ($status == 13)
            return '<span class="badge badge-warning">Pending for labeling</span>';
        if ($status == 14)
            return '<span class="badge badge-success">Labels Printed</span>';
        if ($status == 15)
            return '<span class="badge badge-danger">Declined</span>';
        if ($status == 16)
            return '<span class="badge badge-success">Initialized</span>';
        if ($status == 17)
            return '<span class="badge badge-warning">Skipped</span>';
        return $status;
    }

    public static function can_be_deleted_by_user($status)
    {
        if (!$status)
            return true;
        if ($status == 1)
            return true;
        if ($status == 2)
            return false;
        if ($status == 3)
            return true;
        if ($status == 4)
            return true;
        if ($status == 5)
            return false;
        if ($status == 6)
            return false;
        if ($status == 7)
            return false;
        if ($status == 8)
            return false;
        if ($status == 9)
            return false;
        if ($status == 10)
            return false;
        if ($status == 11)
            return false;
        if ($status == 12)
            return false;
        if ($status == 13)
            return false;
        if ($status == 14)
            return false;
        if ($status == 15)
            return true;
        if ($status == 16)
            return false;
        if ($status == 17)
            return false;
        return $status;
    }

    public static function show_response($status = 0, $code = 0, $body = "")
    {
        $d['status'] = $status;
        $d['code'] = $code;
        $d['body'] = $body;
        print_r(json_encode($d));
        die();
    }
    public static function get_chat_threads($user_id)
    {

        $threads = Chat::where(
            "sender",
            $user_id
        )
            ->orWhere('receiver', $user_id)
            ->orderByDesc('id')
            ->get();

        $done_ids = array();
        $ready_threads = array();
        foreach ($threads as $key => $value) {
            if (in_array($value->thread, $done_ids)) {
                continue;
            }
            $done_ids[] = $value->thread;
            $ready_threads[] = $value;
        }
        return $ready_threads;
    }


    public static function get_chat_thread($sender, $receiver, $product)
    {
        if ($sender == $receiver) {
            return null;
        }
        $thread = $sender . "-" . $receiver . "-" . $product;

        $results = DB::select(
            'select * from chats where 
                (sender = :sender AND
                receiver = :receiver AND
                product_id = :product)
                OR 
                (sender = :_receiver AND
                receiver = :_sender AND
                product_id = :_product) 
                ',
            [
                'sender' => $sender,
                'receiver' => $receiver,
                'product' => $product,
                '_sender' => $sender,
                '_receiver' => $receiver,
                '_product' => $product
            ]
        );
        if (
            $results != null &&
            !empty($results)
        ) {
            $thread = $results[0]->thread;
        }
        return $thread;
    }

    public static function get_file_url($name)
    {
        $url = url("storage/uploads");
        if ($name == null || (strlen($name) < 2)) {
            $url .= '/default.png';
        } else if (file_exists(public_path('storage/uploads' . $name))) {
            $url = url("storage/uploads/" . $name);
        } else {
            $url = url("storage/uploads/" . $name);
        }
        return $url;
    }

    public static function make_slug($str)
    {
        $slug =  strtolower(Str::slug($str, "-"));

        if (
            (!empty(Product::where("slug", $slug)->First())) ||
            (!empty(Profile::where("username", $slug)->First()))
        ) {
            $slug .= rand(100, 1000);
        }

        return $slug;
    }





    public static function upload_images_1($files, $is_single_file = false)
    {

        ini_set('memory_limit', '-1');
        if ($files == null || empty($files)) {
            return $is_single_file ? "" : [];
        }
        $uploaded_images = array();
        foreach ($files as $file) {

            if ( 
                isset($file['name']) &&
                isset($file['type']) &&
                isset($file['tmp_name']) &&
                isset($file['error']) &&
                isset($file['size'])
            ) {
                $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
                $file_name = time() . "-" . rand(100000, 1000000) . "." . $ext;
                $destination = 'public/storage/uploads/' . $file_name;

                $res = move_uploaded_file($file['tmp_name'], $destination);
                if (!$res) {
                    continue;
                }
                //$uploaded_images[] = $destination;
                $uploaded_images[] = $file_name;
            }
        }

        $single_file = "";
        if (isset($uploaded_images[0])) {
            $single_file = $uploaded_images[0];
        }


        return $is_single_file ? $single_file : $uploaded_images;
    }




    public static function upload_images($files)
    {
        if ($files == null || empty($files)) {
            return [];
        }
        if (!isset($files['name'])) {
            return [];
        }
        if (!is_array($files['name'])) {
            return [];
        }

        $uploaded_images = array();
        if (isset($files['name'])) {
            for ($i = 0; $i < count($files['name']); $i++) {
                if (
                    isset($files['name'][$i]) &&
                    isset($files['type'][$i]) &&
                    isset($files['tmp_name'][$i]) &&
                    isset($files['error'][$i]) &&
                    isset($files['size'][$i])
                ) {
                    $img['name'] = $files['name'][$i];
                    $img['type'] = $files['type'][$i];
                    $img['tmp_name'] = $files['tmp_name'][$i];
                    $img['error'] = $files['error'][$i];
                    $img['size'] = $files['size'][$i];


                    $path = Storage::putFile('/', $img['tmp_name']);



                    $path_not_optimized =  "storage/" . $path;
                    $path_optimized = "storage/thumb_" . $path;
                    $thumbnail = Utils::create_thumbail(
                        array(
                            "source" => $path_not_optimized,
                            "target" => $path_optimized,
                        )
                    );

                    if (strlen($thumbnail) > 3) {
                        $thumbnail = str_replace("storage/", "", $thumbnail);
                        $thumbnail = str_replace("/storage", "", $thumbnail);
                        $thumbnail = str_replace("storage", "", $thumbnail);
                        $thumbnail = str_replace("/", "", $thumbnail);
                    } else {
                        $thumbnail = $path;
                    }

                    $ready_image['src'] = $path;
                    $ready_image['thumbnail'] = $thumbnail;

                    $ready_image['user_id'] = Auth::id();
                    if (!$ready_image['user_id']) {
                        $ready_image['user_id'] = 1;
                    }

                    $_ready_image = new Image($ready_image);
                    $_ready_image->save();
                    $uploaded_images[] = $ready_image;
                }
            }
        }

        return $uploaded_images;
    }

    public static function create_thumbail($params = array())
    {
        if (
            !isset($params['source']) ||
            !isset($params['target'])
        ) {
            return [];
        }

        /*

        $p = 'http://127.0.0.1:8000/storage/'.$path;
                    echo '<h1>'.$p.'</h1>';
                    echo '<h1>'.$path.'</h1>';
                    echo '<img src="'.$p.'" alt="">';
                    die();
                    //dd("");
        */

        $image = new Zebra_Image();

        $image->auto_handle_exif_orientation = false;
        $image->source_path = $params['source'];
        $image->target_path = $params['target'];



        $image->jpeg_quality = 75;
        if (isset($params['quality'])) {
            $image->jpeg_quality = $params['quality'];
        }

        $image->preserve_aspect_ratio = true;
        $image->enlarge_smaller_images = true;
        $image->preserve_time = true;
        $image->handle_exif_orientation_tag = true;

        $width = 380;
        $heigt = 220;
        if (isset($params['width'])) {
            $width = $params['width'];
        }
        if (isset($params['heigt'])) {
            $width = $params['heigt'];
        }


        if (!$image->resize($width, $heigt, ZEBRA_IMAGE_CROP_CENTER)) {
            return $image->source_path;
        } else {
            return $image->target_path;
        }
    }
}
