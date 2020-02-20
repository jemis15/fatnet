<?php
namespace App\Controllers;

use App\Models\{Cliente,Contrato,Ticket,Plan};
use Zend\Diactoros\Response\RedirectResponse;
use Zend\Diactoros\ServerRequest;

class ContratoController extends BaseController 
{
    public function getContratos(ServerRequest $request) 
    {
        $cliente = Cliente::findOrFail($request->getAttribute('idcliente'));

        return $this->renderHTML('contrato/contratos.twig',[
            'cliente' => $cliente
        ]);
    }

    public function getContrato(ServerRequest $request) 
    {
        $contrato = Contrato::findOrFail($request->getAttribute('idcontrato'));
        $cliente = Cliente::findOrFail($contrato->cliente_id);

        return $this->renderHTML('contrato/contrato.twig',[
            'contrato' => $contrato,
            'cliente' => $cliente
        ]);
    }
}