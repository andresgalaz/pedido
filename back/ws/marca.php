<?php
include_once 'base.php';

function ejecutar($accion)
{
    // Instanciada en base.php
    $sql = $GLOBALS['sql'];

    include_once 'models/marca.php';
    responseJson($sql->select($marca));
}
ejecutar($PPAL_ACCION);
