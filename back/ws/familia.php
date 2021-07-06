<?php
include_once 'base.php';

function ejecutar($accion)
{
    // Instanciada en base.php
    $sql = $GLOBALS['sql'];

    include_once 'models/familia.php';
    responseJson($sql->select($familia));
}
ejecutar($PPAL_ACCION);
