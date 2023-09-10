<!DOCTYPE html>
<html>
<body>
<a href="index.php">Home</a>
<h1> EVENTS</h1>
<style>
form label {display:block;}
</style>
<?php
$event_type="";
$event_title="";
$event_desc="";
$event_text="";
$event_start="";
$event_end="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $event_type = test_input($_POST["event_type"]);
  $event_title = test_input($_POST["event_title"]);
  $event_desc = test_input($_POST["event_desc"]);
  $event_text = test_input($_POST["event_text"]);
  $event_start = test_input($_POST["event_start"]);
  $event_end = test_input($_POST["event_end"]);
   
   $sql="insert into events (event_type, event_title, event_desc, event_text, event_start, event_end) values ('".$event_type ."','".$event_title ."', '".$event_desc ."', '".$event_text."', '".$event_start ."', '".$event_end ."')";
   
   $con=mysqli_connect("localhost","root","","churchmgt");
	if (mysqli_connect_errno()) {
	   echo "Failed to connect to MySQL: " . mysqli_connect_error();
	 }
	 
	 
	$result= mysqli_query($con,$sql);
   
   if($result==1) echo("<h3>events registered successfully</h3>");
   else echo("<h3>events registered failed</h3>");
  // echo "<pre>".$result." ".$sql."</pre>";
   
   //echo "<h3>thank you: your data is: ".$event_type." ".$event_title." ".$event_desc." ".$event_start." " .$event_end."</h3>";
   
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
 }
?>

<form method="post">
<label>Type:<input name="event_type" ></label>
<label>Title:<input name="event_title"></label>
<label>Description:<input name="event_desc"></label>
<label>Starts:<input name="event_start"></label>
<label>End:<input name="event_end"></label>
</form>

<input type="submit" value="Submit"/>
<input type="reset" value="Cancel"/>

</body>
</html>