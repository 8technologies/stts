<?php

namespace App\Exports;

use App\Models\CropVariety;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class CropVarietyExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return CropVariety::with('crop')->get()->map(function ($item) {
            return [
                'id' => $item->id,
                'label' => "CROP: " . $item->crop->name . ", VARIETY: " . $item->name,
            ];
        });
    }

    public function headings(): array
    {
        return ['ID', 'Label'];
    }
}

