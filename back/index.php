<?php
$rutaArr = explode("/", $_SERVER['SCRIPT_URL']);
// La acción es el último elemento de la URL antes de los parámetros request
$PPAL_ACCION = $rutaArr[count($rutaArr) - 1];
// El PPAL_SERVICIO van desde la posición 2 hasta el largo - 2
$PPAL_SERVICIO = '';
for ($i = 2; $i <= count($rutaArr) - 2; $i++) {
    $PPAL_SERVICIO .= $rutaArr[$i] . '/';
}
if ($PPAL_SERVICIO != '') {
    $PPAL_SERVICIO = substr($PPAL_SERVICIO, 0, strlen($PPAL_SERVICIO) - 1) . '.php';
}

error_log("PPAL_SERVICIO:$PPAL_SERVICIO");
include_once $PPAL_SERVICIO;