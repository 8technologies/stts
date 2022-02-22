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

    public static function can_create_export_form()
    {
        $recs = ImportExportPermit::where('administrator_id',  Admin::user()->id)->get();
        foreach ($recs as $key => $value) {
            if ($value->is_import) {
                continue;
            }

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

    public static function can_create_import_form()
    {
        $recs = ImportExportPermit::where('administrator_id',  Admin::user()->id)->get();
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
            return '<span class="badge badge-info">Pending</span>';
        if ($status == 1)
            return '<span class="badge badge-info">Pending</span>';
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
            return '<span class="badge badge-info">Pending</span>';
        if ($status == 1)
            return '<span class="badge badge-info">Pending</span>';
        if ($status == 2)
            return '<span class="badge badge-primary">Inspection assigned</span>';
        if ($status == 3)
            return '<span class="badge badge-warning">Halted</span>';
        if ($status == 4)
            return '<span class="badge badge-danger">Rejected</span>';
        if ($status == 5)
            return '<span class="badge badge-success">Accepted</span>';
        if ($status == 6)
            return '<span class="badge badge-danger">expired</span>';
        if ($status == 7)
            return '<span class="badge badge-warning">Provisional</span>';
        if ($status == 8)
            return '<span class="badge badge-dark">Used</span>';
        if ($status == 9)
            return '<span class="badge badge-dark">Lab inspection</span>';
        if ($status == 10)
            return '<span class="badge badge-warning">Lab test pending</span>';
        if ($status == 11)
            return '<span class="badge badge-success">Marketable</span>';
        if ($status == 12)
            return '<span class="badge badge-danger">Not Marketable</span>';
        if ($status == 13)
            return '<span class="badge badge-info">Pending for labeling</span>';
        if ($status == 14)
            return '<span class="badge badge-success">Lables Printed</span>';
        if ($status == 15)
            return '<span class="badge badge-danger">Declined</span>';
        return "Pending";
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

        $url = url("/storage");
        if ($name == null || (strlen($name) < 2)) {
            $url .= '/default.png';
        } else if (file_exists(public_path('storage/' . $name))) {
            $url .= "/" . $name;
        } else {
            $url .= '/default.png';
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
