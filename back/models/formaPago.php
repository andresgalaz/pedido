<?php
include_once 'db/tabla.php';

$familia = new Tabla('tFormaPago', array(
    (new Campo('pFormaPago'))->primaryKey(),
    new Campo('cDescripcion'),
));
