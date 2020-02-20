<?php

namespace App\Controllers;

use App\Models\{Cliente,Contrato,Ticket,Plan};

class IndexController extends BaseController 
{
    public function getClientes() 
    {
        $clientes = Cliente::orderBy('created_at','desc')->get();

        return $this->renderHTML('clientes.twig', [
            'clientes' => $clientes,
        ]);
    }

    public function getContratos() 
    {
        $contratos = Contrato::orderBy('created_at','desc')->get();

        return $this->renderHTML('contratos.twig', [
            'contratos' => $contratos,
        ]);
    }

    public function getTickets() 
    {
        $tickets = Ticket::orderBy('created_at','desc')->get();

        return $this->renderHTML('tickets.twig', [
            'tickets' => $tickets,
        ]);
    }
}