<?php

/**
 * Primero valida el TOKEN, si el token no es válido, se rechaza la operación
 */
require "vendor/autoload.php";
use \Firebase\JWT\JWT;

$secret_key = "nO_aMaZoN_2021";
@$authHeader = getallheaders()['Authorization'];
$jwt = null;
if ($authHeader == '') {
    // Se usa para evadir CORS en ambiente de desarollo
    @$jwt = $_GET['token'];
} else {
    // En ambiente de producción se espra que el token venga en
    // Header Authorization Bearer
    $jwt = explode(" ", $authHeader)[1];
}

if ($jwt) {
    try {
        $decoded = JWT::decode($jwt, $secret_key, array('HS256'));
        // error_log(print_r($decoded, true));
        // Access is granted. Add code of the operation here
        // echo json_encode(array("message" => "Access granted:"));
    } catch (Exception $e) {
        http_response_code(401);
        error_log(print_r($jwt, true));
        die(json_encode(array(
            "message" => "Access denied.",
            "error" => $e->getMessage(),
        )));
    }
} else {
    http_response_code(401);
    die(json_encode(array(
        "message" => "Access denied.",
        "error" => "No está presente token JWT",
    )));
}

include_once 'db/conexion.php';
include_once 'db/sql.php';

$cnx = new Conexion();
$sql = new SQL($cnx);

function responseJson($obj)
{
    header("Content-Type: application/json; charset=UTF-8");
    if (!is_object($obj) && !is_array($obj)) {
        $obj = array("message" => $obj);
    }
    echo json_encode($obj);
}

function requestBodyJson()
{
    $val = json_decode(file_get_contents('php://input'));
    if ($val) {
        return get_object_vars($val);
    }
    return null;
}
