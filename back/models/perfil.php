<?php
include_once 'db/tabla.php';

$familia = new Tabla('tPerfil', array(
    (new Campo('pPerfil'))->primaryKey(),
    new Campo('cNombre'),
));
