<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

$msg = '';

// Check that a valid token exists in session from forgot-password.php
if(!isset($_SESSION['reset_token']) || !isset($_SESSION['reset_email'])){
  header('location:forgot-password.php');
  exit();
}

$token = $_SESSION['reset_token'];

// Validate the token - must exist, be unused and not expired
$tokenquery = mysqli_query($con,"select * from tblpasswordreset where Token='$token' and Used=0 and ExpiresAt > NOW()");
$tokenrow = mysqli_fetch_array($tokenquery);

if(!$tokenrow){
  $msg = "Your reset link has expired. Please try again.";
}

if(isset($_POST['submit']) && $tokenrow)
  {
    $newpassword = md5($_POST['newpassword']);
    $userid = $tokenrow['UserId'];
    $tokenid = $tokenrow['ID'];

    // Update the password
    $query = mysqli_query($con,"update tbluser set Password='$newpassword' where ID='$userid'");

    if($query){
      // Mark token as used so it cannot be used again
      mysqli_query($con,"update tblpasswordreset set Used=1 where ID='$tokenid'");

      // Clear session reset variables
      unset($_SESSION['reset_token']);
      unset($_SESSION['reset_email']);

      echo "<script>alert('Password successfully changed. Please login with your new password.');</script>";
      echo "<script>window.location.href='login.php'</script>";
    } else {
      $msg = "Something went wrong. Please try again.";
    }
  }
  ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daily Expense Tracker - Reset Password</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	<script type="text/javascript">
function checkpass()
{
if(document.changepassword.newpassword.value!=document.changepassword.confirmpassword.value)
{
alert('New Password and Confirm Password field does not match');
document.changepassword.confirmpassword.focus();
return false;
}
return true;
} 
</script>
</head>
<body>
	<div class="row">
		<h2 align="center">Daily Expense Tracker</h2>
		<hr />
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Reset Password</div>
				<div class="panel-body">
					<p style="font-size:16px; color:red" align="center"> <?php if($msg){ echo $msg; } ?> </p>

					<?php if($tokenrow){ ?>
					<form role="form" action="" method="post" name="changepassword" onsubmit="return checkpass()">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="New Password" name="newpassword" type="password" value="" required="true" minlength="6">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Confirm Password" name="confirmpassword" type="password" value="" required="true" minlength="6">
							</div>
							<div class="checkbox">
								<button type="submit" value="" name="submit" class="btn btn-primary">Reset</button>
							</div>
							<p>Already Registered <a href="login.php">Login here</a></p>
						</fieldset>
					</form>
					<?php } else { ?>
					<p>Your reset link has expired. <a href="forgot-password.php">Click here to request a new one</a>.</p>
					<?php } ?>

				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	

<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
