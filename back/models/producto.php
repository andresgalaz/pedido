<?php
include_once 'db/tabla.php';

$producto = new Tabla('tProducto', array(
    (new Campo('pProducto'))->primaryKey(),
    new Campo('cDescripcion'),
    (new Campo('nPrecio'))->decimal(),
    (new Campo('fFamilia'))->integer(),
    (new Campo('fMarca'))->integer(),
    new Campo('cSKU'),
    (new Campo('bVigente'))->boolean(),
));
