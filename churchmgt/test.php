<!DOCTYPE html>
<html>
<body>

<h1> WELCOME TO CHURCH MANAGEMENT SYSTEM </h1>
<a href="index.php">Home</a>


<?php
$con=mysqli_connect("localhost","root","","churchmgt");
if (mysqli_connect_errno()) {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
 }
 
 $result = mysqli_query($con,"SELECT * FROM Parish");

 while($row = mysqli_fetch_array($result)) {
   echo $row['Parish_id'] . " " . $row['Parish_Name']." " . $row['Address'];
   echo "<br>";
 }

 
 mysqli_close($con);
$COLOR="blue";
echo "my house is" . $COLOR. "<br>";
echo "my car is" . $COLOR. "<br>";
echo "my shoe is" . $COLOR. "<br>";
?>

</body>
</html>