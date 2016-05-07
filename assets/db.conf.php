<?php
abstract class config {
 
    protected $datahost;
    protected function conectar($file = 'config.ini'){
 
        if (!$adjust = parse_ini_file($file, true)) throw new exception ('No se puede abrir el archivo ' . $file . '.');
        $control = $adjust["database"]["driver"]; //control (MySQL la mayoría de las veces)
        $server = $adjust["database"]["host"]; //servidor como localhost o 127.0.0.1 usar este ultimo cuando el puerto sea diferente
        $port = $adjust["database"]["port"]; //Puerto de la BD
        $db = $adjust["database"]["schema"]; //nombre de la base de datos
 
        try{
            return $this->datahost = new PDO (
                                        "mysql:host=$server;port=$port;dbname=$db",
                                        $adjust['database']['username'], //usuario
                                        $adjust['database']['password'], //constrasena
                                        array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
                                        );
            }
        catch(PDOException $e){
                echo "Error en la conexión: ".$e->getMessage();
            }
    }
}

class conDB extends config 
{  // clase principal de conexion y consultas
    private $conexion;
    private $debug = true;
 
    public function __construct(){
        $this->conexion = parent::conectar(); //creo una variable con la conexión
        return $this->conexion;                                      
    }
 
    public function queryDB($qry, $valores = array()){  //funcion principal, ejecuta todas las consultas
        $result = false;
        if($statement = $this->conexion->prepare($qry)){  //prepara la consulta
            if(preg_match_all("/(:\w+)/", $qry, $campo, PREG_PATTERN_ORDER)){ //tomo los nombres de los campos iniciados con :xxxxx
                $campo = array_pop($campo); //inserto en un arreglo
                foreach($campo as $parametro){
                    $statement->bindValue($parametro, $valores[substr($parametro,1)]);
                }
            }
            try {
                if (!$statement->execute()) { //si no se ejecuta la consulta...
                    if($this->debug){
                        $result = $statement->errorInfo(); //imprimir errores
                        $result["v"] = false; 
                        $result["msj"] = "Error en la consulta -> ".$result[2];
                    }else{
                        $result["v"] = false; 
                        $result["msj"] = "Error en la consulta";
                    }
                }else{
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC); //si es una consulta que devuelve valores los guarda en un arreglo.
                }
                $statement->closeCursor();
            }
            catch(PDOException $e){
                echo "Error de ejecución: \n";
                print_r($e->getMessage());
            }   
        }
        return $result;
        $this->conexion = null; //cerramos la conexión
    } /// Termina funcion queryDB
}/// Termina clase conDB

/*
$obj = new User();

$val = array(
    // "v_Id" => 2,
    "v_IdTDoc" => 2,
    "v_DocIde" => 93010600047,
    "v_Name" => 'Mario',
    "v_Name1" => 'Alejandro',
    "v_LastName" => 'Castiblanco Hernández',
    "v_CodSt" => '302772',
    "v_DateInUni" => '2011-01-01' ,
    "v_Email" => 'mario.castiblancoh@campusucc.edu.co',
    "v_Pass" => '12345',
    "v_RqPass" => 1,
    "v_StateUser" => 1,
    "v_Profile" => 'Student'
);

var_dump($val);
$reg = $obj->newUser($val);
var_dump($reg);
$reg1 = $obj->listUser();
var_dump($reg1);
*/

?>