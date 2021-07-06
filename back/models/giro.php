<?php
include_once 'db/tabla.php';

$familia = new Tabla('tGiro', array(
    (new Campo('pGiro'))->primaryKey(),
    new Campo('cDescripcion'),
));
