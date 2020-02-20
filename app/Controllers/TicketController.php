<?php
namespace App\Controllers;

use App\Models\{Cliente,Contrato,Ticket,Plan};
use Zend\Diactoros\Response\RedirectResponse;
use Zend\Diactoros\ServerRequest;

class TicketController extends BaseController 
{
    public function getTickets(ServerRequest $request) 
    {
        $cliente = Cliente::findOrFail($request->getAttribute('idcliente'));

        return $this->renderHTML('ticket/tickets.twig',[
            'cliente' => $cliente
        ]);
    }

    public function getTicket(ServerRequest $request) 
    {
        $ticket = Ticket::findOrFail($request->getAttribute('idcliente'));
        $cliente = Cliente::findOrFail($ticket->cliente_id);

        return $this->renderHTML('ticket/ticket.twig',[
            'ticket' => $ticket
        ]);
    }
}