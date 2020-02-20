<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cliente extends Model {
    use SoftDeletes;

    protected $table = 'clientes';

    public function contratos()
    {
        $contratos = Contrato::where('cliente_id','=',$this->id)->orderBy('created_at','desc')->get();
        
        return $contratos;
    }

    public function tickets()
    {
        $tickets = Ticket::where('cliente_id','=',$this->id)->orderBy('created_at','desc')->get();
        
        return $tickets;
    }
}