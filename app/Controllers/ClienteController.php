<?php
namespace App\Controllers;

use App\Models\{Cliente,Contrato,Ticket,Plan};
use Zend\Diactoros\Response\RedirectResponse;
use Zend\Diactoros\ServerRequest;

class ClienteController extends BaseController 
{
    public function getPerfil(ServerRequest $request) 
    {
        $cliente = Cliente::findOrFail($request->getAttribute('idcliente'));

        return $this->renderHTML('cliente/perfil.twig',[
            'cliente' => $cliente
        ]);
    }

    public function getContratos(ServerRequest $request) 
    {
        $cliente = Cliente::findOrFail($request->getAttribute('idcliente'));

        return $this->renderHTML('contrato/contratos.twig',[
            'cliente' => $cliente
        ]);
    }
    public function getTickets(ServerRequest $request) 
    {
        $cliente = Cliente::findOrFail($request->getAttribute('idcliente'));

        return $this->renderHTML('ticket/tickets.twig',[
            'cliente' => $cliente
        ]);
    }
}