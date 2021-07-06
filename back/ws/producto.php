<?php
include_once 'base.php';

function ejecutar($accion)
{
    // Instanciasda en base.php
    $sql = $GLOBALS['sql'];

    include_once 'models/producto.php';

    error_log($accion);
    if ($accion == 'list') {
        include_once 'models/vProducto.php';
        $filtro = requestBodyJson();
        error_log("filtro:" . print_r($filtro, true));
        $whe = $sql->where($vProducto, $filtro);
        error_log("where:" . print_r($whe, true));
        responseJson($sql->select($vProducto, $whe));
        return;
    }
    if ($accion == 'get') {
        $filtro = requestBodyJson();
        error_log("filtro:" . print_r($filtro, true));
        $whe = $sql->where($producto, $filtro);
        error_log("where:" . print_r($whe, true));
        responseJson($sql->select($producto, $whe));
        return;
    }
    if ($accion == 'save') {
        $data = requestBodyJson();
        $data['cSKU'] = strtoupper($data['cSKU']);
        responseJson($sql->update($producto, $data));
        return;
    }
    if ($accion == 'delete') {
        responseJson($sql->delete($producto, requestBodyJson()));
        return;
    }
}
ejecutar($PPAL_ACCION);
