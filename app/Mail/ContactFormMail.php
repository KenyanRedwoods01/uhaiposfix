<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;
use Illuminate\Http\Request;

class ContactFormMail extends Mailable
{
    public $request;

    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function build()
    {
        return $this->subject('New Contact Form Submission')
                    ->view('emails.contact_form');  // View for the email body
    }
}
