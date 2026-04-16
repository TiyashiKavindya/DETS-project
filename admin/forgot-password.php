<?php
session_start();
error_reporting(0);
include('../includes/dbconnection.php');

$msg = '';

if(isset($_POST['submit']))
  {
    $contactno = $_POST['contactno'];
    $email = $_POST['email'];

    // Check if email and mobile number match an admin
    $query = mysqli_query($con,"select ID from tbladmin where Email='$email' and MobileNumber='$contactno'");
    $ret = mysqli_fetch_array($query);

    if($ret > 0){
      $adminid = $ret['ID'];

      // Generate a secure random token
      $token = bin2hex(random_bytes(32));
      $expiresAt = date('Y-m-d H:i:s', strtotime('+1 hour'));

      // Delete any old unused tokens for this admin
      mysqli_query($con,"delete from tblpasswordreset where AdminId='$adminid' and Used=0");

      // Store the new token in tblpasswordreset
      mysqli_query($con,"insert into tblpasswordreset(AdminId, Token, ExpiresAt) values('$adminid','$token','$expiresAt')");

      // Store token in session and redirect to reset page
      $_SESSION['admin_reset_token'] = $token;
      $_SESSION['admin_reset_email'] = $email;
      header('location:reset-password.php');

    } else {
      $msg = "Invalid Details. Please try again.";
    }
  }
  ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daily Expense Tracker - Forgot Password</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/datepicker3.css" rel="stylesheet">
	<link href="../css/styles.css" rel="stylesheet">
	
</head>
<body>
	<div class="row">
		<h2 align="center">Daily Expense Tracker</h2>
		<hr />
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Forgot Password</div>
				<div class="panel-body">
					<p style="font-size:16px; color:red" align="center"><?php if($msg){ echo $msg; } ?></p>
					<form role="form" action="" method="post" name="forgotpassword">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="E-mail" name="email" type="email" autofocus="" required="true">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Mobile Number" name="contactno" type="text" value="" required="true">
							</div>
							<div class="checkbox">
								<button type="submit" value="" name="submit" class="btn btn-primary">Reset</button>
								<span style="padding-left:250px"><a href="index.php" class="btn btn-primary">Login</a></span>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	

<script src="../js/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
