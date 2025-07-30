<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{ config('app.name') }} - Notification</title>
</head>
<body style="margin: 0; padding: 0; background-color: #f7f7f7;">
    <table width="100%" cellpadding="0" cellspacing="0" style="font-family: Arial, sans-serif; background-color: #f7f7f7; padding: 20px;">
        <tr>
            <td align="center">
                <table width="600" cellpadding="0" cellspacing="0" style="background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
                    <tr>
                        <td style="padding: 30px;">
                            <h2 style="margin-top: 0; color: #333;">Hello,</h2>

                            <p style="font-size: 15px; color: #555;">
                                {{ $message }}
                            </p>

                            <p style="margin: 30px 0;">
                                <a href="{{ $link }}" 
                                   style="background-color: #28a745; color: #ffffff; font-size:15px; padding: 12px 2px; text-decoration: none; border-radius: 5px; font-weight: bold;">
                                    View Submitted Form
                                </a>
                            </p>

                            <p style="font-size: 14px; color: #777;">
                                Thanks,<br>
                                <strong>{{ config('app.name') }}</strong>
                            </p>
                        </td>
                    </tr>
                </table>

                <p style="font-size: 12px; color: #aaa; margin-top: 20px;">
                    If you believe this email was sent to you by mistake, please disregard it.
                </p>
            </td>
        </tr>
    </table>
</body>
</html>
