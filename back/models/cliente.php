<?php
include_once 'db/tabla.php';

$producto = new Tabla('tCliente', array(
    (new Campo('pCliente'))->primaryKey(),
    new Campo('cRazonSocial'),
    new Campo('cRut'),
    (new Campo('fGiro'))->integer(),
));
