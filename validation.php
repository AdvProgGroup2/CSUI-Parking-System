<?php
	session_start();
	$usernameErr = $passErr = "";
	$validUserName = $validPass = "";
		
	$username = $password  = "";
		
	if ($_SERVER["REQUEST_METHOD"] == "POST"){
	
		if (empty($_POST["username"])) {
			$usernameErr = "Please enter a valid username!";
		}
		else {
			$username = test_input($_POST["username"]);
			$_SESSION['username'] = $username;
			unset($_SESSION['UserErr']);
			$validName="Success!";
		}

			
		if (empty($_POST["password"])){
			$passErr = "Password is required!";
		}
		else{
			$password = test_input($_POST["password"]);
			$password = md5($password);
			$validPass = "Success!";
		}
		
	}
		
	function test_input($data)
	{
		 $data = trim($data);
		 $data = stripslashes($data);
		 $data = htmlspecialchars($data);
		 return $data;
	}
?>