<?php
include_once 'db/vista.php';

$vProducto = new Vista("tProducto p \n
 INNER JOIN tFamilia f ON f.pFamilia = p.fFamilia \n
 INNER JOIN tMarca   m ON m.pMarca   = p.fMarca   \n"
    , array(
        (new Campo('p.pProducto'))->integer(),
        new Campo('p.cDescripcion'),
        (new Campo('p.nPrecio'))->decimal(),
        (new Campo('p.fFamilia'))->integer(),
        new Campo('f.cNombre as cFamilia'),
        (new Campo('p.fMarca'))->integer(),
        new Campo('m.cNombre as cMarca'),
        new Campo('p.cSKU'),
        (new Campo('p.bVigente'))->boolean(),
    ));
