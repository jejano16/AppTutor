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
		if(!isset($_SESSION["Id"]) ){
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
					if(array_pop((explode("/", $_SERVER['REQUEST_URI']))) != $_SESSION["index"] ){
						header("Location:".$_SESSION["index"]);
					}
					break;
				case 2:
					$dir = (empty($_SESSION["index"]))? $_SESSION["index"] : $url;
					$ar["v"]=true;
					$ar["msj"]="Tienes unas sesión iniciada <a class='btn btn-success' href='".$dir."'>Ingresa a la cuenta</a>";
					break;
				default:
					break;
			}
					return $ar;
					
		}

		
	}

}


?>