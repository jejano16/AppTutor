<?php 
	session_start();
	session_destroy();
?>
<!doctype html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>Cerrando sesión...</title>
	</head>
	<body>
		<script type="text/javascript" src="assets/src/js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				localStorage.clear();
				location.href='index.html';
			})
		</script>
	</body>
</html>
