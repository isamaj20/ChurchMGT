<!DOCTYPE html>
<html>
<body>

<h1> VIEW PARISHES </h1>
<a href="index.php">Home</a>

<table border="1" >
<thead>
<tr>
<th>Parish ID</th>
<th>Diocesan ID</th>
<th>Parish Name</th>
<th>Address</th>
<th>Parish Priest </th>
</tr>
</thead>
<tbody>
<?php
$con=mysqli_connect("localhost","root","","churchmgt");
if (mysqli_connect_errno()) {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
 }
 
 $result = mysqli_query($con,"SELECT * FROM Parish");

 while($row = mysqli_fetch_array($result)) {
  // echo $row['Parish_id'] . " " . $row['Parish_Name']." " . $row['Address'];
   //echo "<br>";
   
   echo "<tr>
<td>".$row['Parish_id']." <a href='parish_edit.php?Parish_id=".$row['Parish_id']."'>edit</a></td>
<td>".$row['Diocesan_ID']."</td>
<td>".$row['Parish_Name']."</td>
<td>".$row['Address']."</td>
<td>".$row['PriestInCharge']."</td>
</tr>";
 }

 
 mysqli_close($con);

?>
</tbody>
</table>
</body>
</html>