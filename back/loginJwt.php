<?php
require "vendor/autoload.php";
use \Firebase\JWT\JWT;

$email = "andres.galaz@gmail.com";

$secret_key = "nO_aMaZoN_2021";
$issuer_claim = "compustrom"; // this can be the servername
$audience_claim = "general";
$issuedat_claim = time(); // issued at
$notbefore_claim = $issuedat_claim + 10; //not before in seconds
$expire_claim = $issuedat_claim + 3600 * 24 * 35; // 35 días de duración
$token = array(
    "iss" => $issuer_claim,
    "aud" => $audience_claim,
    "iat" => $issuedat_claim,
    "nbf" => $notbefore_claim,
    "exp" => $expire_claim,
    "data" => array(
        "id" => "100",
        "firstname" => "Andrés",
        "lastname" => "Galaz",
        "email" => $email,
    ));

http_response_code(200);

$jwt = JWT::encode($token, $secret_key);
echo json_encode(
    array(
        "message" => "Successful login.",
        "jwt" => $jwt,
        "email" => $email,
        "expireAt" => $expire_claim,
    ));
