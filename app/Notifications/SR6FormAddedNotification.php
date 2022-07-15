<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;


class SR6FormAddedNotification extends Notification
{
    use Queueable;

    private $sr6_form_data;    // definfin gthis  to be used when crating new sr6 forms

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($sr6_form_data)
    {
        $this->$sr6_form_data = $sr6_form_data;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line($this->sr6_form_data['body'])
                    ->action($this->sr6_form_data['sr6_form_text'], $this->sr6_form_data['url'])
                    ->line($this->sr6_form_data['thank_you_text']);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
