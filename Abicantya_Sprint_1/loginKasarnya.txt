<html>
<head>
	<meta charset="UTF-8">
	<title> Login </title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700">
<link rel="stylesheet" href="style.css">
	<?php
	 session_start();
	 if (isset($_SESSION['login'])) {
	 	header("location:welcome.php");
	 }
	?>
</head>

<body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>
	<form action="login.php" method ="post">
		<div class="login-form">	
			<?php 
				if(isset($_SESSION['error2'])) {
					echo "<h1 style=\"color:red; font-size:16;\">".$_SESSION['error2']."</h1>";
					unset($_SESSION['error2']);
				}
			?>
			<div class="control-group">
				<input type="text" class="login-field" name="username" placeholder="username" id="login-name">
				<label class="login-field-icon fui-user" for="login-name"></label>
			</div>

			<div class="control-group">
				<input type="password" class="login-field" name="password" placeholder="password" id="login-pass">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
			</div>

		    <button type="submit" class="btn btn-primary btn-large btn-block"> Login </button>
    		<a class="login-link" href="register.php"> Don't have account ?</a>
    	</div>
    </form>
</body>
</html>


<?php

	$dboconn = pg_pconnect("host=ipin.cs.ui.ac.id dbname=advprog user=cantya password=cantya123");

	if(!$dboconn) {
		echo "Failed to connect.\n";
	}

	if(isset($_POST['password']) && isset($_POST['username'])) {
		
		$sql = "set search_path to 'tugas3_1306397892'; SELECT * FROM Users;";

		$result = pg_query($dboconn,$sql) or die("Query failed".pg_last_error());

		$username = $_POST['username'];
		$password = md5($_POST['password']);
		$validPass = false;
		$validUser = false;
		$email;

		while($row = pg_fetch_row($result)) { 
			if($row[0] === $username) {
				$validUser = true;
				if ($row[2] === $password) {
					$validPass = true;
					$email = $row[1];
					break;
				}
			}
		}

		if($validPass && $validUser) {
			
			$_SESSION['username'] = $username;
			$_SESSION['email'] = $email;
			$_SESSION['login'] = "true";
			header("location:welcome.php");
		}
		else if(!$validUser) {
			$_SESSION['error2'] = "Username does not exist";
			header("location:login.php");
		}
		else if (!$validPass) {
			$_SESSION['error2'] = "Wrong password";
			header("location:login.php");
		}
		else {
			header("location:login.php");
		}
	}
?>
