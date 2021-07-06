<?php
class Campo
{
    private $nombre = null;
    private $colSql = null;
    private $tipo = null;
    private $isPK = false;
    private $valor = null;

    public const STRING = 1;
    public const INTEGER = 2;
    public const DECIMAL = 3;
    public const TIMESTAMP = 4;
    public const DATE = 5;
    public const BOOLEAN = 6;

    public function __construct($nombre)
    {
        $this->setNombre($nombre);
        $this->tipo = $this::STRING;
        $this->isPk = false;
    }

    public function integer()
    {
        $this->tipo = $this::INTEGER;
        return $this;
    }
    public function decimal()
    {
        $this->tipo = $this::DECIMAL;
        return $this;
    }
    public function date()
    {
        $this->tipo = $this::DATE;
        return $this;
    }
    public function timestamp()
    {
        $this->tipo = $this::TIMESTAMP;
        return $this;
    }
    public function boolean()
    {
        $this->tipo = $this::BOOLEAN;
        return $this;
    }
    public function primaryKey()
    {
        $this->isPK = true;
        $this->tipo = $this::INTEGER;
        return $this;
    }
    public function isNumber()
    {
        return $this->tipo == $this::INTEGER || $this->tipo == $this::DECIMAL;
    }

    public function setNombre($nombre)
    {
        $arr = preg_split("/[\s\.]/", $nombre);
        $this->colSql = $nombre;
        $this->nombre = $arr[count($arr) - 1];
    }
    public function getNombre()
    {
        return $this->nombre;
    }

    public function getColSql()
    {
        return $this->colSql;
    }

    public function setTipo($tipo)
    {
        $this->tipo = $tipo;
    }
    public function getTipo()
    {
        return $this->tipo;
    }

    public function setIsPK($isPK)
    {
        $this->isPK = $isPK;
    }
    public function getIsPK()
    {
        return $this->isPK;
    }

    public function isEmpty($val)
    {
        if ($this->isNumber()) {
            return $val == 0;
        }

        return $val == '';
    }

}
