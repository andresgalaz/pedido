<?php
include_once 'base.php';

function ejecutar($accion)
{
    // Instanciasda en base.php
    $sql = $GLOBALS['sql'];

    include_once 'models/pedido.php';

    error_log($accion);
    if ($accion == 'list') {
        include_once 'models/pedido.php';
        $filtro = requestBodyJson();
        $whe = $sql->where($pedido, $filtro);
        responseJson($sql->select($pedido, $whe));
        return;
    }
    if ($accion == 'get') {
        $filtro = requestBodyJson();
        $whe = $sql->where($pedido, $filtro);
        responseJson($sql->select($pedido, $whe));
        return;
    }
    if ($accion == 'save') {
        $data = requestBodyJson();
        $data['cSKU'] = strtoupper($data['cSKU']);
        responseJson($sql->update($pedido, $data));
        return;
    }
    if ($accion == 'delete') {
        responseJson($sql->delete($pedido, requestBodyJson()));
        return;
    }
}
ejecutar($PPAL_ACCION);
