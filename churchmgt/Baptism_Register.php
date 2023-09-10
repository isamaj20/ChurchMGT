<!DOCTYPE html>
<html>
<body>
<a href="index.php">Home</a>
<h1> BAPTISMAL REGISTER </h1>
<style>
form label {display:block;}
</style>
<?php
$card_number="";
$date_of_baptism="";
$place_of_baptism="";
$baptism_name="";
$date_of_birth="";
$place_of_birth="";
$home_town="";
$father_name="";
$mother_name="";
$sponsor="";
$minister="";
$confirmation="";
$marriage="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $card_number = test_input($_POST["card_number"]);
  $date_of_baptism = test_input($_POST["date_of_baptism"]);
  $place_of_baptism = test_input($_POST["place_of_baptism"]);
  $baptism_name = test_input($_POST["baptism_name"]);
  $date_of_birth = test_input($_POST["date_of_birth"]);
  $place_of_birth = test_input($_POST["place_of_birth"]);
  $home_town = test_input($_POST["home_town"]);
  $father_name = test_input($_POST["father_name"]);
  $mother_name = test_input($_POST["mother_name"]);
  $sponsor = test_input($_POST["sponsor"]);
  $minister = test_input($_POST["minister"]);
  $confirmation = test_input($_POST["confirmation"]);
  $marriage = test_input($_POST["marriage"]);
   
   $sql="insert into baptismal register  (card_number, date_of_baptism, place_of_baptism, baptism_name, date_of_birth, place_of_birth, home_town, father_name, mother_name, sponsor, minister, confirmation, marriage) values ('".$card_number ."','".$date_of_baptism ."','".$place_of_baptism ."','".$baptism_name ."','".$date_of_birth ."','".$place_of_birth."','".$home_town ."','".$father_name ."','".$mother_name ."','".$sponsor ."','".$minister ."','".$confirmation ."','".$marriage ."')";
   
   $con=mysqli_connect("localhost","root","","churchmgt");
	if (mysqli_connect_errno()) {
	   echo "Failed to connect to MySQL: " . mysqli_connect_error();
	 }
	 
	 
	$result= mysqli_query($con,$sql);
   
   if($result==1) echo("<h3>baptismal register successfully</h3>");
   else echo("<h3>baptismal register failed</h3>");
  // echo "<pre>".$result." ".$sql."</pre>";
   
   //echo "<h3>thank you: your data is: ".$card_number." ".$date_of_baptism." ".$place_of_baptism." ".$baptism_name." ".$date_of_birth." ".$place_of_birth." ".$home_town." ".$father_name." ".$mother_name." ".$sponsor." ".$minister." ".$confirmation." " .$marriage."</h3>";
   
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
 }
?>

<form method="post">
<label>Card Number:<input name="card_number" ></label>
<label>Date of Baptism:<input name="date_of_baptism"></label>
<label>Place of Baptism:<input name="place_of_baptism"></label>
<label>Baptism Name:<input name="baptism_name"></label>
<label>Date of Birth:<input name="date_of_birth"></label>
<label>Place of Birth:<input name="place_of_birth"></label>
<label>Home Town:<input name="home_town"></label>
<label>Father Name:<input name="father_name"></label>
<label>Mother Name:<input name="mother_name"></label>
<label>Sponsor:<input name="sponsor"></label>
<label>Minister:<input name="minister"></label>
<label>Confirmation:<input name="confirmation"></label>
<label>Marriage:<input name="marriage"></label>

<input type="submit" value="Submit"/>
<input type="reset" value="Cancel"/>
</form>
</body>
</html>