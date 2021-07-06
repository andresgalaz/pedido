<?php
include_once 'db/tabla.php';

$pedido = new Tabla('tPedidoDet', array(
    (new Campo('pPedidoDet'))->primaryKey(),
    (new Campo('fPedido'))->integer(),
    (new Campo('fProducto'))->integer(),
    (new Campo('nCantidad'))->integer(),
    (new Campo('nPrecio'))->decimal(),
));
