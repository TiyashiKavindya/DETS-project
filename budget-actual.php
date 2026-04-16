<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['detsuid']==0)) {
  header('location:logout.php');
  } else{
  ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Daily Expense Tracker || Budget vs Actual</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/datepicker3.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>
  <?php include_once('includes/header.php');?>
  <?php include_once('includes/sidebar.php');?>

  <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
      <ol class="breadcrumb">
        <li><a href="#"><em class="fa fa-home"></em></a></li>
        <li class="active">Budget vs Actual</li>
      </ol>
    </div><!--/.row-->

    <!-- MONTH SELECTOR FORM -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">Budget vs Actual Report</div>
          <div class="panel-body">
            <div class="col-md-12">
              <form role="form" method="post" action="">
                <div class="form-group">
                  <label>Select Month</label>
                  <input class="form-control" type="month" name="budgetmonth" 
                         value="<?php echo isset($_POST['budgetmonth']) ? $_POST['budgetmonth'] : date('Y-m'); ?>" required="true">
                </div>
                <div class="form-group has-success">
                  <button type="submit" class="btn btn-primary" name="submit">View Report</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- RESULTS TABLE -->
    <?php if(isset($_POST['submit'])){ 
      $userid = $_SESSION['detsuid'];
      $budgetmonth = $_POST['budgetmonth'];
    ?>
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">Report for <?php echo $budgetmonth; ?></div>
          <div class="panel-body">
            <div class="col-md-12">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>S.NO</th>
                      <th>Category</th>
                      <th>Budget Amount</th>
                      <th>Actual Spent</th>
                      <th>Remaining</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                  // Get all budgets for this user and month
                  // Also calculate actual spending for each category in that month
                  $ret = mysqli_query($con,
                    "select b.ID, c.categoryName, b.BudgetAmount,
                     COALESCE(SUM(e.ExpenseCost), 0) as ActualSpent
                     from tblbudget b
                     join tblcategory c on b.CategoryId = c.id
                     left join tblexpense e on e.CategoryId = b.CategoryId
                       and e.UserId = b.UserId
                       and DATE_FORMAT(e.ExpenseDate, '%Y-%m') = b.BudgetMonth
                     where b.UserId='$userid' and b.BudgetMonth='$budgetmonth'
                     group by b.ID, c.categoryName, b.BudgetAmount");

                  $cnt = 1;
                  $found = false;
                  while($row = mysqli_fetch_array($ret)){
                    $found = true;
                    $budget = $row['BudgetAmount'];
                    $actual = $row['ActualSpent'];
                    $remaining = $budget - $actual;

                    // Set status colour
                    if($actual > $budget){
                      $status = '<span style="color:red;font-weight:bold">Over Budget</span>';
                    } elseif($actual >= $budget * 0.8){
                      $status = '<span style="color:orange;font-weight:bold">Nearly Full</span>';
                    } else {
                      $status = '<span style="color:green;font-weight:bold">On Track</span>';
                    }
                  ?>
                    <tr>
                      <td><?php echo $cnt;?></td>
                      <td><?php echo $row['categoryName'];?></td>
                      <td><?php echo number_format($budget, 2);?></td>
                      <td><?php echo number_format($actual, 2);?></td>
                      <td><?php echo number_format($remaining, 2);?></td>
                      <td><?php echo $status;?></td>
                    </tr>
                  <?php $cnt++; } ?>

                  <?php if(!$found){ ?>
                    <tr>
                      <td colspan="6" align="center">No budgets found for this month. <a href="set-budget.php">Set a budget</a>.</td>
                    </tr>
                  <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>

    <?php include_once('includes/footer.php');?>
  </div><!--/.main-->

<script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/chart.min.js"></script>
  <script src="js/chart-data.js"></script>
  <script src="js/easypiechart.js"></script>
  <script src="js/easypiechart-data.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/custom.js"></script>

</body>
</html>
<?php } ?>
