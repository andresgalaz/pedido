<?php
/*
 * ==========================================================
 * Ejecuta sentencias SQL
 * ==========================================================
 */
class SQL
{
    public $conexion;
    // public $tabla = null;
    // public $orden = null;
    // public $where = null;

    public function __construct($conexion)
    {
        $this->conexion = $conexion;
    }

    public function delete($tabla, $data)
    {
        // Actualiza
        $where = '';
        for ($i = 0; $i < count($tabla->getCampos()); $i++) {
            $fld = $tabla->getCampos()[$i];
            @$val = $data[$fld->getNombre()];
            if ($fld->getIsPK()) {
                $where .= (strlen($where) > 0 ? " and " : "") . $fld->getColSql() . ($val ? "='$val'" : " is null");
            }

        }
        if ($where == '') {
            return array("success" => false, "message" => "No hay condición para el DELETE");
        }

        $cSql = 'DELETE FROM ' . $tabla->getNombre() . ' where ' . $where;
        error_log($cSql);
        if ($this->conexion->query($cSql)) {
            return array("success" => true);
        }
        error_log("Error:" . $this->conexion->getMessage() . "\n" . $cSql);
        return array("success" => false, "message" => $this->conexion->getMessage());
    }

    public function select($tabla, $where = null, $orderBy = null)
    {
        $colSql = '';
        for ($i = 0; $i < count($tabla->getCampos()); $i++) {
            $colSql .= ($i > 0 ? " , " : "") . $tabla->getCampos()[$i]->getColSql();
        }
        $cSql = "SELECT $colSql FROM  " . $tabla->getNombre();
        if ($where && $where != '') {
            $cSql .= " WHERE $where ";
        }

        if ($orderBy && $orderBy != '') {
            $cSql .= " ORDER BY $orderBy ";
        }

        $cursor = $this->conexion->query($cSql);
        if (!$cursor) {
            error_log('Error:' . $this->conexion->getMessage() . "\n" . $cSql);
            return array("success" => false, "message" => $this->conexion->getMessage());
        }

        $rows = array();
        // MYSQLI_NUM
        while ($row = $cursor->fetch_array(MYSQLI_ASSOC)) {
            for ($i = 0; $i < count($tabla->getCampos()); $i++) {
                $fld = $tabla->getCampos()[$i];
                if ($fld->getTipo() == $fld::INTEGER) {
                    $row[$fld->getNombre()] = (int) $row[$fld->getNombre()];
                } else if ($fld->getTipo() == $fld::DECIMAL) {
                    $row[$fld->getNombre()] = (float) $row[$fld->getNombre()];
                } else if ($fld->getTipo() == $fld::BOOLEAN) {
                    $row[$fld->getNombre()] = ($row[$fld->getNombre()] == 1 ? true : false);
                }
            }
            $rows[] = $row;
        }
        $cursor->free_result();

        return array("success" => true, "records" => $rows);
    }

    /**
     * Inserta un registro independiente del valor de las PK
     */
    public function insert($tabla, $data)
    {
        return update($tabla, $data, true);
    }
    /**
     * Inserta o Actualiza dependiendo de si la PK están establecidas
     */
    public function update($tabla, $data, $bInserta = false)
    {
        if (!$data) {
            return;
        }

        if (!$bInserta) {
            // Si no es Insert forzado, se evalua si es un update o insert de acuerdo a las PK
            for ($i = 0; $i < count($tabla->getCampos()); $i++) {
                $fld = $tabla->getCampos()[$i];
                @$val = $data[$fld->getNombre()];
                if ($fld->getIsPK()) {
                    if ($fld->isEmpty($val)) {
                        $bInserta |= true;
                        break;
                    }
                }
            }
        }

        $cSql = null;
        if ($bInserta) {
            // Inserta
            $colSql = '';
            $valSql = '';
            for ($i = 0; $i < count($tabla->getCampos()); $i++) {
                $fld = $tabla->getCampos()[$i];
                @$val = $data[$fld->getNombre()];
                if ($fld->getIsPK()) {
                    if (!$fld->isEmpty($val)) {
                        $colSql .= (strlen($colSql) > 0 ? ", " : "") . $fld->getColSql();
                        $valSql .= (strlen($valSql) > 0 ? ", " : "") . ($val ? "'$val'" : "null");
                    }
                } else {
                    $colSql .= (strlen($colSql) > 0 ? ", " : "") . $fld->getColSql();
                    $valSql .= (strlen($valSql) > 0 ? ", " : "") . ($val ? "'$val'" : "null");
                }
            }
            $cSql = 'INSERT INTO ' . $tabla->getNombre() . ' (' . $colSql . ') values (' . $valSql . ')';
            // $oResp->mensaje = 'Registro insertado correctamente';
        } else {
            // Actualiza
            $colSql = '';
            $valSql = '';
            for ($i = 0; $i < count($tabla->getCampos()); $i++) {
                $fld = $tabla->getCampos()[$i];
                @$val = $data[$fld->getNombre()];
                if ($fld->getIsPK()) {
                    $colSql .= (strlen($colSql) > 0 ? " and " : "") . $fld->getColSql() . ($val ? "='$val'" : " is null");
                } else {
                    $valSql .= (strlen($valSql) > 0 ? " , " : "") . $fld->getColSql() . ($val ? "='$val'" : "null");
                }
            }
            $cSql = 'UPDATE ' . $tabla->getNombre() . ' set ' . $valSql . ' where ' . $colSql;
            // $oResp->mensaje = 'Registro actualizado correctamente';
        }
        if ($this->conexion->query($cSql)) {
            return array("success" => true, "id" => $this->conexion->insertId());
        }
        error_log("Error:" . $this->conexion->getMessage() . "\n" . $cSql);
        return array("success" => false, "message" => $this->conexion->getMessage());
    }

    /**
     * Arma el WHERE para un filtro simple
     */
    public function where($tabla, $data)
    {
        if (!$data) {
            return null;
        }

        $whe = '';
        for ($i = 0; $i < count($tabla->getCampos()); $i++) {
            $fld = $tabla->getCampos()[$i];
            @$val = $data[$fld->getNombre()];
            if ($val) {
                $whe .= (strlen($whe) > 0 ? " and " : "") . $fld->getColSql() . "='$val'";
            }
        }
        return $whe;
    }
}
