<?php 
	date_default_timezone_set("America/Bogota"); //Zona horaria
	header('Content-Type: text/plain; charset=utf-8'); //Codificación
	header ("Expires: Thu, 27 Mar 1980 23:59:00 GMT"); //la pagina expira en una fecha pasada
	header ("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); //ultima actualizacion ahora cuando la cargamos
	header ("Cache-Control: no-cache, must-revalidate"); //no guardar en CACHE
	header ("Pragma: no-cache"); 
	error_reporting(E_ALL ^ E_NOTICE);

	/* Configuración de ini_set */
	ini_set('memory_limit', '-1');
	ini_set('max_execution_time', 300);

	require_once "auth.class.php";

	// Cambiar comillas por codificación en html
	function htmlspecialcharsQuotes(&$value) {
	  $value = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
	  return $value;
	}

	function convertArray($array, $op){
		$arrMod = array();
		switch ($op) {
			case 'q':
				$arrMod = array_map("htmlspecialcharsQuotes", $array);
				break;
			case 'q+c':
				$arrMod = array_map("htmlspecialcharsQuotes", $array);
				$arrMod = array_map("utf8_decode", $arrMod);
				break;
			
			default:
				$arrMod = $array;
				break;
		}

		return $arrMod;

	}

	require_once "../db.conf.php";
?>