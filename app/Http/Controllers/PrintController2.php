<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf; 


class PrintController2 extends Controller
{

 
    public function index()
    {

      
        PDF::setOptions([
            'debugCss' => false, 
            'dpi' => 150, 
            'defaultFont' => 'sans-serif',
            
        ]);

        $pdf = \PDF::loadView('pdf.test', ['ROMINA']) 
            ->setWarnings(false);
        return $pdf->stream();
        die("Good to go!");
    }

    // 
}
