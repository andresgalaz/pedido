<?php
require "vendor/autoload.php";
use \Firebase\JWT\JWT;

$secret_key = "nO_aMaZoN_2021";
$authHeader = getallheaders()['Authorization'];
$jwt = explode(" ", $authHeader)[1];

if ($jwt) {
    try {
        $decoded = JWT::decode($jwt, $secret_key, array('HS256'));
        error_log(print_r($decoded,true));
        // Access is granted. Add code of the operation here
        echo json_encode(array(
            "message" => "Access granted:",
        ));
    } catch (Exception $e) {
        http_response_code(401);
        die( json_encode(array(
            "message" => "Access denied.",
            "error" => $e->getMessage(),
        )));
    }
}
