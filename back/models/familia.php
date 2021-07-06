<?php
include_once 'db/tabla.php';

$familia = new Tabla('tFamilia', array(
    (new Campo('pFamilia'))->primaryKey(),
    new Campo('cNombre'),
));
