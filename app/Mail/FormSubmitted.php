<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;


class FormSubmitted extends Mailable
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
        // return $this->view('view.name'); 
        return $this->from('sttstestmail@gmail.com', 'You have successfully added a form')
        ->view('emails.form_added');
    }

    public function notify(Request $request)
    {
        $user = Administrator::findOrFail($request->user_id);
        // Send the email...
        Mail::to($request->user())->send(new $this($user));
    }
}
