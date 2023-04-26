<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Envelope;

class Notification extends Mailable
{
    use Queueable, SerializesModels;
        public $message;
        public $link;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($message, $link)
    {
        $this->message = $message;
        $this->link = $link;
    }


    /**
 * Get the message envelope.
 */
// public function envelope(): Envelope
// {
//     return new Envelope(
//         from: new Address('info@8technologies.store', 'STTS'),
//         subject: 'Form Status Update',
//     );
// }

/**
 * Get the message content definition.
 */
// public function content(): Content
// {
//     return new Content(
//         view: 'emails.forms.notification',
//     );
// }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('info@8technologies.store', 'STTS')
                    ->subject('Form Status Update')
                    ->markdown('emails.forms.notification');
    }
}
