<!DOCTYPE html>
<html>
<body>
<a href="index.php">Home</a>
<h1> PARISHIONER REGISTRATION</h1>
<style>
form label {display:block;}
</style>
<?php
$Name="";
$Address="";
$Soceity="";
$Date_of_Birth="";
$Phone_Number="";
$Sex="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $Name = test_input($_POST["Name"]);
  $Address = test_input($_POST["Address"]);
  $Society = test_input($_POST["Society"]);
  $Date_of_Birth = test_input($_POST["Date_of_Birth"]);
  $Phone_Number = test_input($_POST["Phone_Number"]);
  $Sex = test_input($_POST["Sex"]);
  
   $sql="insert into parishioners (`Name` , `Address` , `Society`, `Date_of_Birth`, `Phone_Number`, `sex`)
             VALUES ('', '".$Name."', '".$Address."', '".$Society."', '".$Date_of_Birth."', '".$Phone_Number."', '".$Sex."');";	 
   $con=mysqli_connect("localhost","root","","churchmgt");
	if (mysqli_connect_errno()) {
	   echo "Failed to connect to MySQL: " . mysqli_connect_error();
	 }
	 
	$result= mysqli_query($con,$sql);
   
   if($result==1) echo("<h3>parishioners registered successfully</h3>");
   else echo("<h3>parishioners registered failed</h3>");
  // echo "<pre>".$result." ".$sql."</pre>";
   
   //echo "<h3>thank you: your data is: ".$Parish_Name." ".$Address." ".$Society." ".$Date_of_Birth." ".$Phone_Number." ".$Sex."</h3>";
   
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
 }
?>

<form method="post">
<label>Name:<input name="Name" ></label>
<label>Address:<input name="Address"></label>
<label>Society:<input name="Society"></label>
<label>Date of Birth:<input name="Date_of_Birth"></label>
<label>Phone Number:<input name="Phone_Number"></label>
<label>Sex: </label>
<input type="radio" name="sex" value="male">Male<br>
<input type="radio" name="sex" value="female">Female
<label>Baptised: </label>
<input type="radio" name="Baptised" value="Yes">Yes<br>
<input type="radio" name="Baptised" value="No">No
<label>Marital Status: </label>
<input type="radio" name="Marital Status" value="Married">Married<br>
<input type="radio" name="Marital Status" value="Single">Single<br>
<input type="radio" name="Marital Status" value="widow">widow
</form> 
<input type="submit" value="Submit"/>
<input type="reset" value="Cancel"/>

</form>
</body>
</html>