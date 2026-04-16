<?php
session_start();
error_reporting(0);
include('../includes/dbconnection.php');
if (strlen($_SESSION['detsadminid']==0)) {
  header('location:logout.php');
  } else{
  ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daily Expense Tracker - Dashboard</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/datepicker3.css" rel="stylesheet">
	<link href="../css/styles.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	
	<?php include_once('includes/header.php');?>
	<?php include_once('includes/sidebar.php');?>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><em class="fa fa-home"></em></a></li>
				<li class="active">Dashboard</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->

		<div class="row">

			<!-- Today's Expense -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$tdate = date('Y-m-d');
					$query = mysqli_query($con,"select ROUND(sum(ExpenseCost),2) as todaysexpense from tblexpense where date(ExpenseDate)='$tdate'");
					$result = mysqli_fetch_array($query);
					$sum_today_expense = $result['todaysexpense'];
					?>
						<h4>Today's Expense</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="<?php echo $sum_today_expense;?>">
							<span class="percent"><?php echo ($sum_today_expense == "") ? "0" : $sum_today_expense; ?></span>
						</div>
					</div>
				</div>
			</div>

			<!-- Yesterday's Expense -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$ydate = date('Y-m-d', strtotime("-1 days"));
					$query1 = mysqli_query($con,"select ROUND(sum(ExpenseCost),2) as yesterdayexpense from tblexpense where (ExpenseDate)='$ydate'");
					$result1 = mysqli_fetch_array($query1);
					$sum_yesterday_expense = $result1['yesterdayexpense'];
					?>
						<h4>Yesterday's Expense</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="<?php echo $sum_yesterday_expense;?>">
							<span class="percent"><?php echo ($sum_yesterday_expense == "") ? "0" : $sum_yesterday_expense; ?></span>
						</div>
					</div>
				</div>
			</div>

			<!-- Last 7 Days Expense -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$pastdate = date("Y-m-d", strtotime("-1 week"));
					$crrntdte = date("Y-m-d");
					$query2 = mysqli_query($con,"select ROUND(sum(ExpenseCost),2) as weeklyexpense from tblexpense where ((ExpenseDate) between '$pastdate' and '$crrntdte')");
					$result2 = mysqli_fetch_array($query2);
					$sum_weekly_expense = $result2['weeklyexpense'];
					?>
						<h4>Last 7day's Expense</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="<?php echo $sum_weekly_expense;?>">
							<span class="percent"><?php echo ($sum_weekly_expense == "") ? "0" : $sum_weekly_expense; ?></span>
						</div>
					</div>
				</div>
			</div>

			<!-- Last 30 Days Expense -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$monthdate = date("Y-m-d", strtotime("-1 month"));
					$query3 = mysqli_query($con,"select ROUND(sum(ExpenseCost),2) as monthlyexpense from tblexpense where ((ExpenseDate) between '$monthdate' and '$crrntdte')");
					$result3 = mysqli_fetch_array($query3);
					$sum_monthly_expense = $result3['monthlyexpense'];
					?>
						<h4>Last 30day's Expenses</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="<?php echo $sum_monthly_expense;?>">
							<span class="percent"><?php echo ($sum_monthly_expense == "") ? "0" : $sum_monthly_expense; ?></span>
						</div>
					</div>
				</div>
			</div>

		</div><!--/.row-->

		<div class="row">

			<!-- Current Year Expense -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$cyear = date("Y");
					$query4 = mysqli_query($con,"select ROUND(sum(ExpenseCost),2) as yearlyexpense from tblexpense where (year(ExpenseDate)='$cyear')");
					$result4 = mysqli_fetch_array($query4);
					$sum_yearly_expense = $result4['yearlyexpense'];
					?>
						<h4>Current Year Expenses</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="<?php echo $sum_yearly_expense;?>">
							<span class="percent"><?php echo ($sum_yearly_expense == "") ? "0" : $sum_yearly_expense; ?></span>
						</div>
					</div>
				</div>
			</div>

			<!-- Total Expenses -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$query5 = mysqli_query($con,"select ROUND(sum(ExpenseCost),2) as totalexpense from tblexpense");
					$result5 = mysqli_fetch_array($query5);
					$sum_total_expense = $result5['totalexpense'];
					?>
						<h4>Total Expenses</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="<?php echo $sum_total_expense;?>">
							<span class="percent"><?php echo ($sum_total_expense == "") ? "0" : $sum_total_expense; ?></span>
						</div>
					</div>
				</div>
			</div>

			<!-- Total Categories -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$query6 = mysqli_query($con,"select count(id) as totalcategory from tblcategory");
					$result6 = mysqli_fetch_array($query6);
					$totalcategories = $result6['totalcategory'];
					?>
						<h4>Total Listed Categories</h4>
						<a href="manage-category.php">
							<div class="easypiechart" id="easypiechart-blue" data-percent="100">
								<span class="percent"><?php echo $totalcategories; ?></span>
							</div>
						</a>
					</div>
				</div>
			</div>

			<!-- Total Registered Users -->
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
					<?php
					$query7 = mysqli_query($con,"select count(ID) as totalusers from tbluser");
					$result7 = mysqli_fetch_array($query7);
					$totalusers = $result7['totalusers'];
					?>
						<h4>Total Registered Users</h4>
						<a href="reg-users.php">
							<div class="easypiechart" id="easypiechart-teal" data-percent="100">
								<span class="percent"><?php echo $totalusers; ?></span>
							</div>
						</a>
					</div>
				</div>
			</div>

		</div><!--/.row-->

	</div><!--/.main-->
	<?php include_once('includes/footer.php');?>

	<script src="../js/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/chart.min.js"></script>
	<script src="../js/chart-data.js"></script>
	<script src="../js/easypiechart.js"></script>
	<script src="../js/easypiechart-data.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/custom.js"></script>

</body>
</html>
<?php } ?>
