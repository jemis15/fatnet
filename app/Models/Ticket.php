<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ticket extends Model {
    use SoftDeletes;

    protected $table = 'tickets';

    public function contrato()
    {
        $contrato = Contrato::findOrFail($this->contrato);

        return $contrato;
    }

    public function cliente()
    {
        $cliente = Cliente::findOrFail($this->cliente_id);

        return $cliente;
    }
}