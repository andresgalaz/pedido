<?php
include_once 'campo.php';
class Tabla
{
    protected $nombre = null;
    protected $arrayCampo = null;

    public function __construct($nombre, $campos = array())
    {
        $this->nombre = $nombre;
        $this->arrayCampo = $campos;
    }

    /*
     * Recibe un campo tipo la clase Campo, sino se asume string
     */
    public function addColumn($campo)
    {
        if (!$arrayCampo) {
            $arrayCampo = array();
        }
        if (!is_object($campo)) {
            $campo = new Campo($campo, Campo . STRING, false);
        }
        array_push($arrayCampo, $campo);
    }

    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }
    public function getNombre()
    {
        return $this->nombre;
    }

    public function setCampos($arrayCampo)
    {
        $this->arrayCampo = $arrayCampo;
    }
    public function getCampos()
    {
        return $this->arrayCampo;
    }
}
