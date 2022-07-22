<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;


class SR6FormAdded extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.forms.formsr6added');
    }








    //     /**
    //  * Create a new message instance.
    //  *
    //  * @return void
    //  */
    // public function __construct($user)
    // {
    //     $this->to  = $user;
    //     $this->fromMailer = 'info@8technologies.store';
    //     $this->locale('en');
    // }

    // /**
    //  * Build the message.
    //  *
    //  * @return $this
    //  */
    // public function build()
    // {
    //     // return $this->view('emails.forms.formsr6added');
    //     return $this->markdown('emails.forms.formsr6added')->subject('New SR6 Added');
    // }
}
