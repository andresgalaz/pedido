<?php
include_once 'base.php';

function ejecutar($accion)
{
    // Instanciasda en base.php
    $sql = $GLOBALS['sql'];

    include_once 'models/clienteSucursal.php';

    error_log($accion);
    if ($accion == 'list') {
        $filtro = requestBodyJson();
        $whe = $sql->where($clienteSucursal, $filtro);
        responseJson($sql->select($clienteSucursal, $whe));
        return;
    }
    if ($accion == 'get') {
        $filtro = requestBodyJson();
        $whe = $sql->where($clienteSucursal, $filtro);
        responseJson($sql->select($clienteSucursal, $whe));
        return;
    }
    if ($accion == 'save') {
        $data = requestBodyJson();
        $data['cSKU'] = strtoupper($data['cSKU']);
        responseJson($sql->update($clienteSucursal, $data));
        return;
    }
    if ($accion == 'delete') {
        responseJson($sql->delete($clienteSucursal, requestBodyJson()));
        return;
    }
}
ejecutar($PPAL_ACCION);
