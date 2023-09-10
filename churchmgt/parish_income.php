<!DOCTYPE html>
<html>
<body>
<a href="index.php">Home</a>
<h1> PARISH INCOME</h1>
<style>
form label {display:block;}
</style>
<?php
$Inc_Id="";
$main_parish_income="";
$diocesan_support="";
$Insurance="";
$second_collection="";
$special_collection="";
$special_donation="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $Inc_Id = test_input($_POST["Inc_Id"]);
  $main_parish_income = test_input($_POST["main_parish_income"]);
   $diocesan_support = test_input($_POST["diocesan_support"]);
   $Insurance = test_input($_POST["Insurance"]);
   $second_collection = test_input($_POST["second_collection"]);
   $special_collection = test_input($_POST["special_collection"]);
   $special_donation = test_input($_POST["special_donation"]);
   
   $sql="insert into parish_income (Inc_Id, main_parish_income, diocesan_support, Insurance, second_collection, special_collection, special_donation) values ('".$Inc_Id ."','".$main_parish_income ."','".$diocesan_support ."' ,'".$Insurance ."','".$second_collection ."','".$special_collection ."' , '".$special_donation ."')";
   
   $con=mysqli_connect("localhost","root","","churchmgt");
	if (mysqli_connect_errno()) {
	   echo "Failed to connect to MySQL: " . mysqli_connect_error();
	 }
	 
	 
	$result= mysqli_query($con,$sql);
   
   if($result==1) echo("<h3>parish_income registered successfully</h3>");
   else echo("<h3>parish_income registered failed</h3>");
  // echo "<pre>".$result." ".$sql."</pre>";
   
   //echo "<h3>thank you: your data is: ".$main_parish_income." ".$diocesan_support." ".$Insurance." ".$second_collection." ".$special_collection." " .$special_donation."</h3>";
   
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
 }
?>

<form method="post">
<label>Inc_Id:<input name="Inc_Id" ></label>
<label>main_parish_income:<input name="main_parish_income"></label>
<label>diocesan_support:<input name="diocesan_support" ></label>
<label>Insurance:<input name="Insurance" ></label>
<label>second_collection:<input name="second_collection" ></label>
<label>special_collection:<input name="special_collection" ></label>
<label>special_donation:<input name="special_donation"></label>

<input type="submit" value="Submit"/>
<input type="reset" value="Cancel"/>
</form>
</body>
</html>