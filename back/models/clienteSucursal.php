<?php
include_once 'db/tabla.php';

$clienteSucursal = new Tabla('tClienteSucursal', array(
    (new Campo('pClienteSucursal'))->primaryKey(),
    (new Campo('fCliente'))->integer(),
    new Campo('cNombre'),
    new Campo('cDireccion'),
    (new Campo('fComuna'))->integer(),
));
