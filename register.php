<?php
	session_start();
	$userErr = $passErr = $passErr2 = "";
	//check session
	if(isset($_SESSION['userErr']) or isset($_SESSION['passErr']) or isset($_SESSION['passErr2'])){
		$userErr = $_SESSION['userErr'];
		$passErr = $_SESSION['passErr'];
		$passwErr = $_SESSION['passErr2'];
		
		session_destroy();
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign Up</title>
		<style>
			.error{
				color: red;
			}
		</style>
	</head>
	<body>
		<section class="loginform">
			<!-- Make form with the method post and checkregister.php -->
			<form class="form" method="post" action="checkregister.php" novalidate>
				<h1 class="top">Register</h1>
				<?php if (!(empty($usernameErr) || empty($passErr))) { ?>
					<?php echo '<div class="error alert">' ?>
						<?php echo "<p>" .$userErr."</p>";?>
						<?php echo "<p>" .$passErr."</p>";?>
						<?php echo "<p>" .$passErr2."</p>";?>
					<?php echo '</div>' ?>
				<?php }?>
				
				</div>
				<table class="middle">
					<tr>
						<td><label for="full_name">Full name</label></td>
						<td><input type="text" name="full_name" placeholder="full_name" value="<?php if (!empty($_SESSION["full_name"])) echo $_SESSION['name'] ?>" >							
						</td>
					</tr>
					<tr>
						<td><label for="npm">NPM</label></td>
						<td><input type="text" name="npm" placeholder="npm" value="<?php if (!empty($_SESSION["npm"])) echo $_SESSION['npm'] ?>" >							
						</td>
					</tr>
					<tr>
						<td><label for="username">Username</label></td>
						<td><input type="text" name="username" placeholder="username" value="<?php if (!empty($_SESSION["username"])) echo $_SESSION['username'] ?>" >							
						</td>
					</tr>
					<tr>
						<td><label for="password">Password</label></td>
						<td><input type="password" name="password" placeholder="password">
						</td>
					</tr>
					<tr>
						<td><label for="password2">Repeat password</label></td>
						<td><input type="password" name="password2" placeholder="password">
						</td>
					</tr>
					<tr>
						<td class="bottom" colspan="2"><input type="submit" value="Register"></td>
					</tr>
				</table>
			</form>
		</section>
	</body>
</html>