<?php
/*
			//Connect to database if the database is postgres			
			//pg_connect is used to connect to the database
			$database = pg_connect("host=localhost dbname=register user=psql password=psql") or die("Could not connect to the database.");
			
			//pg_query: 			
			$result = pg_query("set search_path to register") or die("Could not execute query.");
*/
			
			session_start();
			
			$userErr = $passErr = $passErr2 = "";
			$username = $password = $password2 = "";
			$count = 0;
			
			$username = check_input($_POST["username"]);
			$password = check_input($_POST["password"]);
			$password2 = check_input($_POST["password2"]);					
			
			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				if (empty($username)) {					
					$_SESSION['userErr'] = "Please enter your desired username.";
					$count += 0;
				} else {								
					// check if usernamename only contains letters
					if (!preg_match('/^[A-Za-z][A-Za-z0-9]{10,19}$/',$username)) { 	//if there are other than letters, periods and underscore
						$_SESSION['userErr'] = "You can only have letters numbers, ., and _ in your username! Only 11-20 characters are allowed.";
						$count += 0;
					} else {
						$result = pg_query("select * from users where username='" .($username). "'");
						if (pg_num_rows($result) >= 1) {
							$_SESSION['userErr'] = "Sorry, your username is already taken!";
							$count += 0;
						} else {
							$count += 1;
							$_SESSION['username'] = $username;
							unset($_SESSION['userErr']);
						}
					}
				}

				if (empty($_POST["password"])) {				
					$_SESSION['passErr'] = "Please enter your password!"; //if the password is empty
					$count += 0;
				} else {
					if (!preg_match('/^[A-Za-z0-9]{7,20}$/',$password)) {	
						$_SESSION_['passErr'] = "Only letters and numbers are allowed, 8-21 characters please.";
						$count += 0;
					} else { 
						$count += 1;
						$_SESSION['password'] = $password;
						unset($_SESSION['passErr']);
					}
				}
				
				if (empty($_POST["password2"])) {
					$_SESSION['passErr2'] = "Please retype your password to continue!";
					$count += 0;
				} else {
					
					if ($password2 != $password) {	
						$_SESSION['passErr2'] = "Please redo, your password does not match!";
						$count += 0;
					} else {			
						$count += 1;
						$_SESSION['password2'] = $password2;
						unset($_SESSION['passErr2']);
					}
					
				}

			}
			
		?>

<?php
	function check_input($data)
	{
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
?> 