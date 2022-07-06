<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;


class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    
   

}























// /*
//  /**
//      * @param Request $request
//      * @param Throwable $e
//      * @return JsonResponse|Response|\Symfony\Component\HttpFoundation\Response
//      * @throws Throwable
//      */
//     public function render($request, Throwable $e)
//     {
//         if ($request->is('api/*')) {
//             return response()->json([
//                 'message' => 'Ok. The request was successfully completed.'
//             ], 200);
//         } 
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Created. A new resource was successfully created.'
//             ], 201);
//         } 
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Bad Request. The request was invalid.'
//             ], 400);
//         } 
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Unauthorized. Invalid login credentials.'
//             ], 401);
//         }
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Forbidden. You do not have enough permissions to perform this action.'
//             ], 403);
//         }
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Not Found. The requested resource/page not found.'
//             ], 404);
//         }
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Method Not Allowed. This request is not supported by the resource.'
//             ], 405);
//         }
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Conflict. The request could not be completed due to a conflict.'
//             ], 409);
//         }
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Internal Server Error. The request was not completed due to an internal error on the server side.'
//             ], 500);
//         }
//         if($request->is('api/*')){
//             return response()->json([
//                 'message' => 'Service Unavailable. The server was unavailable.'
//             ], 503);
//         }

//         return parent::render($request, $e);
//     }


// */