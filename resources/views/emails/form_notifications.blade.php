@component('mail::message')
# Hello

<p> {{$message}}</p>

@component('mail::button', ['url' => $link, 'color' => 'green', ])
View Form
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent