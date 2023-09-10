<!DOCTYPE html>
<html>
<body>

<h1> VIEW PARISHIONERS </h1>
<a href="index.php">Home</a>

<table border="1" >
<thead>
<tr>
<th>Parishioner_ID</th>
<th>Name</th>
<th>Address</th>
<th>Society</th>
<th>Date_of_Birth</th>
<th>Phone_Number</th>
<th>Sex</th>
</tr>
</thead>
<tbody>
<?php
$con=mysqli_connect("localhost","root","","churchmgt");
if (mysqli_connect_errno()) {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
 }
 
 $result = mysqli_query($con,"SELECT * FROM Parishioners");

 while($row = mysqli_fetch_array($result)) {
  // echo $row['Parishioner_id'] . " " . $row['Name']." " . $row['Address']. " " . $row['Society']." " .$row['Date_of_Birth']." " . $row['Phone_Number']." " . $row['Sex']. ";
   //echo "<br>";
      echo "<tr>
	  
<td>".$row['Parishioner_ID']." <a href='parishioner_edit.php?Parishioner_ID=".$row['Parishioner_ID']."'>edit</a></td>
<td>".$row['Name']."</td>
<td>".$row['Address']."</td>
<td>".$row['society']."</td>
<td>".$row['Date_of_Birth']."</td>
<td>".$row['Phone_Number']."</td>
<td>".$row['Sex']."</td>
</tr>";
 }

 
 mysqli_close($con);

?>
</tbody>
</table>
</body>
</html>