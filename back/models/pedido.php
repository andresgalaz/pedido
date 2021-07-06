<?php
include_once 'db/tabla.php';

$pedido = new Tabla('tPedido', array(
    (new Campo('pPedido'))->primaryKey(),
    (new Campo('dDespacho'))->date(),
    new Campo('cNota'),
    (new Campo('tCreacion'))->timestamp(),
    (new Campo('fFormaPago'))->integer(),
    (new Campo('fEstado'))->integer(),
    (new Campo('fClienteSucursal'))->integer(),
    (new Campo('fUsuario'))->integer()
));
