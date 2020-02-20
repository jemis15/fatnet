<?php

ini_set('display_errors', 1);
ini_set('display_starup_error', 1);
error_reporting(E_ALL);

require_once '../vendor/autoload.php';

session_start();

$dotenv = new Dotenv\Dotenv(__DIR__ . '/..');
$dotenv->load();

use App\Middlewares\AuthenticationMiddleware;
use Illuminate\Database\Capsule\Manager as Capsule;
use Aura\Router\RouterContainer;
use WoohooLabs\Harmony\Harmony;
use WoohooLabs\Harmony\Middleware\DispatcherMiddleware;
use WoohooLabs\Harmony\Middleware\HttpHandlerRunnerMiddleware;
use Zend\Diactoros\Response;
use Zend\HttpHandlerRunner\Emitter\SapiEmitter;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;

$container = new DI\Container();

$capsule = new Capsule;
$capsule->addConnection([
    'driver'    => getenv('DB_DRIVER'),
    'host'      => getenv('DB_HOST'),
    'database'  => getenv('DB_NAME'),
    'username'  => getenv('DB_USER'),
    'password'  => getenv('DB_PASS'),
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
    'port'      => getenv('DB_PORT')
]);

// Make this Capsule instance available globally via static methods... (optional)
$capsule->setAsGlobal();
// Setup the Eloquent ORM... (optional; unless you've used setEventDispatcher())
$capsule->bootEloquent();

$log = new Logger('app');
$log->pushHandler(new StreamHandler(__DIR__ . '/../logs/app.log', Logger::WARNING));

$request = Zend\Diactoros\ServerRequestFactory::fromGlobals(
    $_SERVER,
    $_GET,
    $_POST,
    $_COOKIE,
    $_FILES
);

$routerContainer = new RouterContainer();
$map = $routerContainer->getMap();
//index
$map->get('index.clientes', '/clientes', [
    'App\Controllers\IndexController',
    'getClientes'
]);
$map->get('index.contratos', '/contratos', [
    'App\Controllers\IndexController',
    'getContratos'
]);
$map->get('index.tickets', '/tickets', [
    'App\Controllers\IndexController',
    'getTickets'
]);

//clientes
$map->get('cliente.perfil', '/clientes/{idcliente}/perfil', [
    'App\Controllers\ClienteController',
    'getPerfil'
]);
$map->get('cliente.contratos', '/clientes/{idcliente}/contratos', [
    'App\Controllers\ContratoController',
    'getContratos'
]);
$map->get('cliente.ticktes', '/clientes/{idcliente}/tickets', [
    'App\Controllers\TicketController',
    'getTickets'
]);

//contrato
$map->get('contrato.ver', '/contratos/{idcontrato}', [
    'App\Controllers\ContratoController',
    'getContrato'
]);

//tickets
$map->get('ticket.ver', '/tickets/{idticket}', [
    'App\Controllers\TicketController',
    'getTicket'
]);



$map->get('loginForm', '/login', [
    'App\Controllers\AuthController',
    'getLogin'
]);
$map->get('logout', '/logout', [
    'App\Controllers\AuthController',
    'getLogout'
]);
$map->post('auth', '/auth', [
    'App\Controllers\AuthController',
    'postLogin'
]);


$matcher = $routerContainer->getMatcher();
$route = $matcher->match($request);

try{
    $harmony = new Harmony($request, new Response());

    $harmony->addMiddleware(new HttpHandlerRunnerMiddleware(new SapiEmitter()));
    if (getenv('DEBUG') === "true") {
        $harmony->addMiddleware(new \Franzl\Middleware\Whoops\WhoopsMiddleware);
    }
    $harmony->addMiddleware(new Middlewares\AuraRouter($routerContainer))
        ->addMiddleware(new AuthenticationMiddleware())
        ->addMiddleware(new DispatcherMiddleware($container, 'request-handler'));

    $harmony();
} catch (Exception $e) {
    $log->error($e->getMessage());
    $emitter = new SapiEmitter();
    $emitter->emit(new Response\EmptyResponse(500));
} catch (Error $e) {
    $log->error($e->getMessage());
    $emitter = new SapiEmitter();
    $emitter->emit(new Response\EmptyResponse(500));
}

