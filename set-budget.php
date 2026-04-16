<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['detsuid']==0)) {
  header('location:logout.php');
  } else{

$msg = '';

if(isset($_POST['submit']))
  {
    $userid = $_SESSION['detsuid'];
    $categoryid = $_POST['categoryid'];
    $budgetmonth = $_POST['budgetmonth'];
    $budgetamount = $_POST['budgetamount'];

    // Check if a budget already exists for this user, category and month
    $check = mysqli_query($con,"select ID from tblbudget where UserId='$userid' and CategoryId='$categoryid' and BudgetMonth='$budgetmonth'");
    if(mysqli_num_rows($check) > 0){
      // Update existing budget
      $query = mysqli_query($con,"update tblbudget set BudgetAmount='$budgetamount' where UserId='$userid' and CategoryId='$categoryid' and BudgetMonth='$budgetmonth'");
      if($query){
        echo "<script>alert('Budget updated successfully.');</script>";
      } else {
        echo "<script>alert('Something went wrong. Please try again.');</script>";
      }
    } else {
      // Insert new budget
      $query = mysqli_query($con,"insert into tblbudget(UserId, CategoryId, BudgetMonth, BudgetAmount) values('$userid','$categoryid','$budgetmonth','$budgetamount')");
      if($query){
        echo "<script>alert('Budget set successfully.');</script>";
      } else {
        echo "<script>alert('Something went wrong. Please try again.');</script>";
      }
    }
  }

  // Handle delete
  if(isset($_GET['delid'])){
    $delid = intval($_GET['delid']);
    $userid = $_SESSION['detsuid'];
    mysqli_query($con,"delete from tblbudget where ID='$delid' and UserId='$userid'");
    echo "<script>alert('Budget deleted successfully.');</script>";
    echo "<script>window.location.href='set-budget.php'</script>";
  }
  ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Daily Expense Tracker || Set Budget</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/datepicker3.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">
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
        <li class="active">Set Budget</li>
      </ol>
    </div><!--/.row-->

    <!-- SET BUDGET FORM -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">Set Monthly Budget</div>
          <div class="panel-body">
            <div class="col-md-12">
              <form role="form" method="post" action="">

                <div class="form-group">
                  <label>Category</label>
                  <select name="categoryid" class="form-control" required="true">
                    <option value="">-- Select Category --</option>
                    <?php
                    $cats = mysqli_query($con,"select * from tblcategory order by categoryName");
                    while($cat = mysqli_fetch_array($cats)){ ?>
                      <option value="<?php echo $cat['id'];?>"><?php echo $cat['categoryName'];?></option>
                    <?php } ?>
                  </select>
                </div>

                <div class="form-group">
                  <label>Month</label>
                  <input class="form-control" type="month" name="budgetmonth" required="true">
                </div>

                <div class="form-group">
                  <label>Budget Amount</label>
                  <input class="form-control" type="number" step="0.01" name="budgetamount" placeholder="0.00" required="true">
                </div>

                <div class="form-group has-success">
                  <button type="submit" class="btn btn-primary" name="submit">Save Budget</button>
                </div>

              </form>
            </div>
          </div>
        </div><!-- /.panel-->
      </div><!-- /.col-->
    </div><!-- /.row -->

    <!-- EXISTING BUDGETS TABLE -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">Your Budgets</div>
          <div class="panel-body">
            <div class="col-md-12">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>S.NO</th>
                      <th>Category</th>
                      <th>Month</th>
                      <th>Budget Amount</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                  $userid = $_SESSION['detsuid'];
                  $ret = mysqli_query($con,"select b.ID, b.BudgetMonth, b.BudgetAmount, c.categoryName
                                           from tblbudget b
                                           join tblcategory c on b.CategoryId = c.id
                                           where b.UserId='$userid'
                                           order by b.BudgetMonth DESC");
                  $cnt = 1;
                  while($row = mysqli_fetch_array($ret)){ ?>
                    <tr>
                      <td><?php echo $cnt;?></td>
                      <td><?php echo $row['categoryName'];?></td>
                      <td><?php echo $row['BudgetMonth'];?></td>
                      <td><?php echo $row['BudgetAmount'];?></td>
                      <td><a href="set-budget.php?delid=<?php echo $row['ID'];?>" onclick="return confirm('Delete this budget?')">Delete</a></td>
                    </tr>
                  <?php $cnt++; } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div><!-- /.panel-->
      </div><!-- /.col-->
      <?php include_once('includes/footer.php');?>
    </div><!-- /.row -->
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
