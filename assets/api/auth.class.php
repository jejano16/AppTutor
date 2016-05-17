<?php session_start();
date_default_timezone_set("America/Bogota");
error_reporting(E_ALL ^ E_NOTICE);
class auth
{
	
	
	function __construct()
	{
		
	}

	// Validar Login
	public static function authLogin($url,$op)
	{
		if(!isset($_SESSION["Id_us"]) ){
			// echo "No se ha inciado sesión";
			switch ($op) {
				case 2:
					$ar["v"]=false;
					$ar["msj"]="Acceso restringido <a href='close.php'>Iniciar Sesión</a>";
					return $ar;
					break;
				default:
					// header("HTTP/1.1 301 Moved Permanently");
					header("Location: ".$url);
					
					break;
			}
			
		}else{
			switch ($op) {
				case 1:
					$dir = (empty($_SESSION["index"]))? $_SESSION["index"] : $url;
					$ar["v"]=true;
					$ar["msj"]="Tienes unas sesión iniciada <a class='btn btn-success' href='".$dir."'>Ingresa a la cuenta</a>";
					break;
				default:
					$ar["v"]=false;
					break;
			}
					return $ar;
					
		}
	}

}


?>