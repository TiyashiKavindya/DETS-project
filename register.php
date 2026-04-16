<?php 
session_start();
error_reporting(0);
include('includes/dbconnection.php');

$msg = '';

if(isset($_POST['submit']))
  {
    $fname = $_POST['name'];
    $mobno = $_POST['mobilenumber'];
    $email = $_POST['email'];
    $password = md5($_POST['password']);

    // Role ID 2 = User (standard user role)
    $roleid = 2;

    // Check if email already exists
    $ret = mysqli_query($con, "select Email from tbluser where Email='$email'");
    $result = mysqli_fetch_array($ret);

    if($result > 0){
      $msg = "This email is already associated with another account.";
    } else {
      $query = mysqli_query($con, "insert into tbluser(RoleId, FullName, MobileNumber, Email, Password) values('$roleid','$fname','$mobno','$email','$password')");
      if($query){
        echo "<script>alert('You have successfully registered');</script>";
        echo "<script type='text/javascript'> document.location ='index.php'; </script>";
      } else {
        echo "<script>alert('Something Went Wrong. Please try again');</script>";
      }
    }
  }
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daily Expense Tracker - Signup</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	<script type="text/javascript">
function checkpass()
{
if(document.signup.password.value!=document.signup.repeatpassword.value)
{
alert('Password and Repeat Password field does not match');
document.signup.repeatpassword.focus();
return false;
}
return true;
} 
</script>
</head>
<body>
	<div class="row">
		<h2 align="center">Daily Expense Tracker | User Registration</h2>
		<hr />
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Sign Up</div>
				<div class="panel-body">
					<p style="font-size:16px; color:red" align="center"><?php if($msg){ echo $msg; } ?></p>
					<form role="form" action="" method="post" name="signup" onsubmit="return checkpass();">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Full Name" name="name" type="text" required="true">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="E-mail" name="email" type="email" required="true">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="mobilenumber" name="mobilenumber" placeholder="Mobile Number" maxlength="10" pattern="[0-9]{10}" required="true">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password" value="" required="true" minlength="6">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="repeatpassword" name="repeatpassword" placeholder="Repeat Password" required="true" minlength="6">
							</div>
							<div class="checkbox">
								<button type="submit" value="submit" name="submit" class="btn btn-primary">Register</button>
							</div>
							<p>Already Registered <a href="login.php">Login here</a></p>
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	

<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
