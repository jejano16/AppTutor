<?php require_once "assets/api/auth.class.php";
    auth::authLogin("close.php",1);

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Admin. <?php echo $_SESSION["Name"]; ?></title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/src/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta name="viewport" content="width=device-width, init-scale=1">
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <a class="navbar-img" href="admin.php">
	        <img alt="Header Image" src="img/img_code_ico.png">
	      </a>
	      <a class="navbar-brand" href="admin.php">Code Gram</a>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><small>Bienvenido(a)</small> <i class="glyphicon glyphicon-user"></i> <?php echo $_SESSION["Name"]." ".$_SESSION["Name1"]." ".$_SESSION["LastName"]; ?> <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#"><i class="glyphicon glyphicon-user"></i> Rol : Admnistrador</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="admin.php"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
	            <!-- <li><a href="#"><i class="glyphicon glyphicon-info-sign"></i> Información de usuario</a></li> -->
	            <li role="separator" class="divider"></li>
	            <li><a href="close.php"><i class="glyphicon glyphicon-log-out"></i> Cerrar sesión</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	        
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="msj-prin"></div>
	<div class="container">
		<div>
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist" id="tab-stud">
		    <li role="presentation" class="active"><a href="#tab-st-1" aria-controls="tab-st-1" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-check"></i> Crear Examen</a></li>
		    <li role="presentation"><a href="#tab-st-2" aria-controls="tab-st-2" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-education"></i> Crear Temas a evaluar</a></a></li>
		  </ul>

		  <!-- Tab panes -->
		  

		</div>
		<div class="tab-content">
		  	<!-- Tab Exam -->
		    <div role="tabpanel" class="tab-pane active" id="tab-st-1">
		    	<div class="page-header">
				  <h1 class="text-center">Crear examen <br><small>Ingresa las pruebas para evaluar los conocimientos de los estudintes</small></h1>
				</div>
				<div class="row">
					<div class="list-group">
						<a href="#" class="list-group-item" data-toggle="modal" data-target="#exam">
							<h4 class="list-group-item-heading"><i class="glyphicon glyphicon-plus"></i> Crear Examen</h4>
							<p class="list-group-item-text">Crear una nueva prueba</p>
						</a>
					</div>
				</div>
		    </div>
		    <!-- End Tab Exam-->
		    <!-- Tab Topic-->
		    <div role="tabpanel" class="tab-pane" id="tab-st-2">
		    	<div class="page-header">
				  <h1 class="text-center">Temas a Evaluar <br><small>Aquí encontraras los temas evaluados de acuerdo a lo respondido en el (los) exámen(es) realizado(s)</small></h1>
				</div>
			    	<div class="row">
					  <button class="btn btn-warning"><i class="glyphicon glyphicon-plus"></i>	Crear nuevo tema</button>
					</div>
		    </div>
		    <!-- End Tab Topic-->
	  </div>
		
	</div>


<div class="modal fade" id="exam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><i class="glyphicon glyphicon-console"></i> Examen No. 1</h4>
      </div>
      <div class="modal-body">
      	<div class="btn-group">
	      	<!-- <button type="button" class="btn btn-default" data-dismiss="modal"><i class="glyphicon glyphicon-menu-left"></i> Pregunta anterior</button> -->
	      		<form class="form-horizontal">
				  <div class="form-group">
				    <div class="col-sm-12">
				      <h4>Preguntas <span class="label label-info">No 1</span> de 20</h4>
				      <br>
				      <textarea name="contentask" id="contentask" placeholder="Escribir el contenido de la pregunta"></textarea>
				    </div>
				  </div>
				  <div class="form-group col-sm-6">
				    <div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="pr1" value="1">
					    <textarea name="rst1" id="rst1" placeholder="Escriba el contenido de la respuesta No 1"></textarea>
					  </label>
					</div>
				  </div>
				  <div class="form-group col-sm-6">
				    <div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="pr2" value="2">
					    <textarea name="rst2" id="rst2" placeholder="Escriba el contenido de la respuesta No 2"></textarea>
					  </label>
					</div>
				  </div>
				  <div class="form-group col-sm-6">
				    <div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="pr3" value="3">
					    <textarea name="rst3" id="rst3" placeholder="Escriba el contenido de la respuesta No 3"></textarea>
					  </label>
					</div>
				  </div>
				  <div class="form-group col-sm-6">
				    <div class="radio">
					  <label>
					    <input type="radio" name="optionsRadios" id="pr4" value="4">
					    <textarea name="rst4" id="rst4" placeholder="Escriba el contenido de la respuesta No 4"></textarea>
					  </label>
					</div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10">
				      <span  class="help-block">Selecciona cual respuesta es la correcta</span>
				      <button type="button" class="btn btn-success"><i class="glyphicon glyphicon-menu-right"></i> Guardar y Continuar</button>
				    </div>
				  </div>
	      	</form>
	        
      	</div>
      </div>
      <div class="modal-footer">
      	<h4>Preguntas <span class="label label-info">No 1</span> de 20</h4>
      	<!-- <nav class="foot-quest">
      	  <h4 class="text-right">Preguntas:</h4>
		  <ul class="pagination">
		    <li><a href="#">1</a></li>
		    <li class="active"><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#">6</a></li>
		    <li><a href="#">7</a></li>
		    <li><a href="#">8</a></li>
		    <li><a href="#">9</a></li>
		    <li><a href="#">10</a></li>
		    <li><a href="#">11</a></li>
		    <li><a href="#">12</a></li>
		    <li><a href="#">13</a></li>
		    <li><a href="#">14</a></li>
		    <li><a href="#">15</a></li>
		    <li><a href="#">16</a></li>
		    <li><a href="#">17</a></li>
		    <li><a href="#">18</a></li>
		    <li><a href="#">19</a></li>
		    <li><a href="#">20</a></li>
		  </ul>
		</nav> -->
      </div>
    </div>
  </div>
</div>






	<script type="text/javascript" src="assets/src/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/src/js/bootstrap.js"></script>
	<script type="text/javascript" src="assets/src/js/min/moment.min.js"></script>
	<script type="text/javascript" src="assets/src/js/min/locales.min.js"></script>
	<script type="text/javascript" src="assets/src/js/stupidtable.min.js"></script>
	<script type="text/javascript" src="js/config.js"></script>
	<script type="text/javascript" src="js/student.class.js"></script>
</body>
</html>