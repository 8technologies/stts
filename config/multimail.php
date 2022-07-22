<?php

return [
    /*
    |--------------------------------------------------------------------------
    | List your email providers
    |--------------------------------------------------------------------------
    |
    | Enjoy a life with multimail
    |
    */
    'use_default_mail_facade_in_tests' => true,

    'emails'  => [
        'info@8technologies.store' => [
            'pass'          => env('MAIL_PASSWORD'),
            'username'      => env('MAIL_USERNAME'),
            'from_name'     => env('MAIL_FROM_NAME'),
            'reply_to_mail' => env('MAIL_REPLY_TO_ADDRESS'),
        ],
        'info@8technologies.store'  => [
            'pass'     => env('second_mail_password'),
        ],
    ],

    'provider' => [
        'default' => [
            'host'      => env('MAIL_HOST'),
            'port'      => env('MAIL_PORT'),
            'encryption' => env('MAIL_ENCRYPTION'),
        ],
    ],

];
