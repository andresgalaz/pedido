<?php
include_once 'db/tabla.php';

$marca = new Tabla('tMarca', array(
    (new Campo('pMarca'))->primaryKey(),
    new Campo('cNombre'),
));
