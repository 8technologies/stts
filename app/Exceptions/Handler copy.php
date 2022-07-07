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








// 100 => "Continue"
// 101 => "Switching Protocols"
// 102 => "Processing"
// 200 => "OK"
// 201 => "Created"
// 202 => "Accepted"
// 203 => "Non-Authoritative Information"
// 204 => "No Content"
// 205 => "Reset Content"
// 206 => "Partial Content"
// 207 => "Multi-Status"
// 300 => "Multiple Choices"
// 301 => "Moved Permanently"
// 302 => "Found"
// 303 => "See Other"
// 304 => "Not Modified"
// 305 => "Use Proxy"
// 306 => "(Unused)"
// 307 => "Temporary Redirect"
// 308 => "Permanent Redirect"
// 400 => "Bad Request"
// 401 => "Unauthorized"
// 402 => "Payment Required"
// 403 => "Forbidden"
// 404 => "Not Found"
// 405 => "Method Not Allowed"
// 406 => "Not Acceptable"
// 407 => "Proxy Authentication Required"
// 408 => "Request Timeout"
// 409 => "Conflict"
// 410 => "Gone"
// 411 => "Length Required"
// 412 => "Precondition Failed"
// 413 => "Request Entity Too Large"
// 414 => "Request-URI Too Long"
// 415 => "Unsupported Media Type"
// 416 => "Requested Range Not Satisfiable"
// 417 => "Expectation Failed"
// 418 => "I'm a teapot"
// 419 => "Authentication Timeout"
// 420 => "Enhance Your Calm"
// 422 => "Unprocessable Entity"
// 423 => "Locked"
// 424 => "Failed Dependency"
// 424 => "Method Failure"
// 425 => "Unordered Collection"
// 426 => "Upgrade Required"
// 428 => "Precondition Required"
// 429 => "Too Many Requests"
// 431 => "Request Header Fields Too Large"
// 444 => "No Response"
// 449 => "Retry With"
// 450 => "Blocked by Windows Parental Controls"
// 451 => "Unavailable For Legal Reasons"
// 494 => "Request Header Too Large"
// 495 => "Cert Error"
// 496 => "No Cert"
// 497 => "HTTP to HTTPS"
// 499 => "Client Closed Request"
// 500 => "Internal Server Error"
// 501 => "Not Implemented"
// 502 => "Bad Gateway"
// 503 => "Service Unavailable"
// 504 => "Gateway Timeout"
// 505 => "HTTP Version Not Supported"
// 506 => "Variant Also Negotiates"
// 507 => "Insufficient Storage"
// 508 => "Loop Detected"
// 509 => "Bandwidth Limit Exceeded"
// 510 => "Not Extended"
// 511 => "Network Authentication Required"
// 598 => "Network read timeout error"
// 599 => "Network connect timeout error");







// Code 	Status 	Description
// 200 	Ok The request was successfully completed.
// 201 	Created. A new reesource was successfully created.
// 400 	Bad Request The request was invalid.
// 401 	Unauthorized. Invalid login credentials.
// 403 	Forbidden. You do not have enough permissions to perform this action.
// 404 	Not Found The requested resource/page not found.
// 405 	Method Not Allowed. This request is not supported by the resource.
// 409 	Conflict. The request could not be completed due to a conflict.
// 500 	Internal Server Error. The request was not completed due to an internal error on the server side.
// 503 	Service Unavailable. The server was unavailable.
// */