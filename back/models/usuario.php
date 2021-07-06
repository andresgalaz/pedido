<?php
include_once 'db/tabla.php';

$producto = new Tabla('tUsuario', array(
    (new Campo('pUsuario'))->primaryKey(),
    new Campo('cUsuario'),
    new Campo('cNombre'),
    new Campo('cPassword'),
    new Campo('cEmail'),
    (new Campo('fPerfil'))->integer(),
));
