<?php 
	require_once "conf.php";
	require_once "user.class.php";

	if(isset($_POST["func"]))
	{
		$json = array();
		$user = new user();
		$post = $_POST;
		$n_post =  convertArray($post,"q+c");

		switch ($_POST["func"]) {
			case 'loginsend':
				
				$json = $user->loginSend($n_post);
				break;
			case 'create_user':
				$json = $user->newUser($n_post);
				break;
			default:
				break;
		}

		if(isset($_SESSION["Profile"]) && $_SESSION["Profile"] == 'Admin'){

		}

		if(isset($_SESSION["Profile"]) && $_SESSION["Profile"] == 'Student'){

		}

		echo json_encode($json);
	}

?>