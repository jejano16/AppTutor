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
			case 'loginSend':
				$json = $user->loginSend();
				break;
			case 'create_user':
				$json = $user->newUser($n_post);
				break;
			default:
				break;

		}

		echo json_encode($json);
	}

?>