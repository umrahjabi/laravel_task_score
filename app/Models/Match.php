<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Match extends Model
{
    use HasFactory;
    protected $guarded  = [];
    public function team1(){
        return $this->belongsTo('App\Models\Team', 'team1', 'id');
    }
    public function team2(){
        return $this->belongsTo('App\Models\Team', 'team2', 'id');
    }
}
