<!DOCTYPE html>
<html>
<body>
<a href="index.php">Home</a>
<h1> PARISH REGISTRATION</h1>
<style>
form label {display:block;}
</style>
<?php
$Parish_Name="";
$Address="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $Parish_Name = test_input($_POST["Parish_Name"]);
  $Address = test_input($_POST["Address"]);
   $PriestInCharge = test_input($_POST["PriestInCharge"]);
   
   $sql="insert into parish (Parish_Name, Address, PriestInCharge) values ('".$Parish_Name ."','".$Address ."', '".$PriestInCharge ."')";
   
   $con=mysqli_connect("localhost","root","","churchmgt");
	if (mysqli_connect_errno()) {
	   echo "Failed to connect to MySQL: " . mysqli_connect_error();
	 }
	 
	 
	$result= mysqli_query($con,$sql);
   
   if($result==1) echo("<h3>parish registered successfully</h3>");
   else echo("<h3>parish registered failed</h3>");
  // echo "<pre>".$result." ".$sql."</pre>";
   
   //echo "<h3>thank you: your data is: ".$Parish_Name." ".$Address." " .$PriestInCharge."</h3>";
   
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
 }
?>

<form method="post">
<label>Name:<input name="Parish_Name" ></label>
<label>Address:<input name="Address"></label>
<label>Priest:<input name="PriestInCharge"></label>

<input type="submit" value="Submit"/>
<input type="reset" value="Cancel"/>
</form>
</body>
</html>