<?php
include_once 'db/tabla.php';

$familia = new Tabla('tEstado', array(
    (new Campo('pEstado'))->primaryKey(),
    new Campo('cDescripcion'),
));
