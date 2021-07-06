<?php
include_once 'tabla.php';
class Vista extends Tabla
{
    protected $fromSql = null;

    public function __construct($fromSql, $campos = array())
    {
        $this->fromSql = $fromSql;
        $this->arrayCampo = $campos;
    }

    public function setNombre($fromSql){
        $this->fromSql=$fromSql;
    }
    public function getNombre(){
        return $this->fromSql;
    }

}
