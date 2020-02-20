<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contrato extends Model {
    use SoftDeletes;

    protected $table = 'contratos';

    public function plan()
    {
        $plan = Plan::findOrFail($this->plan_id);

        return $plan;
    }

    public function cliente()
    {
        $cliente = Cliente::findOrFail($this->cliente_id);

        return $cliente;
    }
}