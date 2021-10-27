<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImportExportPermitsHasCrops extends Model
{
    use HasFactory;
    public function import_export_permit()
    {
        return $this->belongsTo(ImportExportPermit::class, 'import_export_permit_id');
    }
    protected $fillable = [
        'crop_id',
        'varieties',
        'import_export_permit_id',
        'category',
        'weight',
    ];
}
