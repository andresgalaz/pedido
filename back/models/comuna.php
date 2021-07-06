<?php
include_once 'db/tabla.php';

$marca = new Tabla('tComuna', array(
    (new Campo('pComuna'))->primaryKey(),
    new Campo('cLocalidad'),
    new Campo('cCiudad'),
    new Campo('cRegion'),
));
