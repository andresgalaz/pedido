<?php
/*
 * ==========================================================
 * Conexión a la base de datos
 * ==========================================================
 */
class Conexion
{
    public $id_cnx = null;
    public $msgError = '';

    public function __construct()
    {
        $conf = parse_ini_file("config.ini");
        $this->id_cnx = new mysqli($conf['DB_HOST'] . ':' . $conf['DB_PORT'], $conf['DB_USER'], $conf['DB_PASSWD'], $conf['DB_NAME']);
        if ($this->id_cnx) {
            $this->id_cnx->set_charset('utf8');
            $this->id_cnx->query("SET NAMES 'utf8'");
            $this->msgError = '';
        } else {
            $this->msgError = "No se pudo conectar a la base";
            $this->id_cnx = null;
        }
    }

    public function close()
    {
        if ($this->id_cnx == null) {
            return;
        }

        $this->id_cnx->close();
    }

    /**
     * Obtiene un ID de conexión
     */
    public function get()
    {
        return $this->id_cnx;
    }

    /**
     * Ejecuta el metodo QUERY de la conexión
     */
    public function query($c)
    {
        $cursor = $this->id_cnx->query($c);
        $this->msgError = $this->id_cnx->error;
        return $cursor;
    }

    public function insertId()
    {
        return $this->id_cnx->insert_id;
    }

    public function getMessage()
    {
        return $this->msgError;
    }

    public function setDatabase($dbName)
    {
        $this->id_cnx->select_db($dbName);
        return $this->id_cnx;
    }

}
