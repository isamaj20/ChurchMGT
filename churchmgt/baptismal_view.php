<!DOCTYPE html>
<html>
<body>

<h1> VIEW BAPTISM RECORDS </h1>
<a href="index.php">Home</a>

<table border="1" >
<thead>
<tr>
<th>card_number</th>
<th>date_of_baptism</th>
<th>place_of_baptism</th>
<th>baptism_name</th>
<th>date_of_birth</th>
<th>place_of_birth</th>
<th>home_town</th>
<th>father_name</th>
<th>mother_name</th>
<th>sponsor</th>
<th>minister</th>
<th>confirmation</th>
<th>marriage </th>
</tr>
</thead>
<tbody>
<?php
$con=mysqli_connect("localhost","root","","churchmgt");
if (mysqli_connect_errno()) {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
 }
 
 $result = mysqli_query($con,"SELECT * FROM 'baptismal register'");

 while($row = mysqli_fetch_array($result)) {
  // echo $row['card_number'] . " " . $row['date_of_baptism']. " " . $row['place_of_baptism']. " " . $row['baptism_name']. " " . $row['date_of_birth']. " " . $row['place_of_birth]. " " . $row['home_town']. " " . $row['father_name']. " " . $row['mother_name']. " " . $row['sponsor']. " " . $row['minister']. " " . $row['confirmation']. " " . $row['marriage'];
   //echo "<br>";
      echo "<tr>
<td>".$row['card_number']." <a href='card_number_edit.php?card_number=".$row['card_number']."'>edit</a></td>
<td>".$row['date_of_baptism']."</td>
<td>".$row['place_of_baptism']."</td>
<td>".$row['baptism_name']."</td>
<td>".$row['date_of_birth']."</td>
<td>".$row['place_of_birth']."</td>
<td>".$row['home_town']."</td>
<td>".$row['father_name']."</td>
<td>".$row['mother_name']."</td>
<td>".$row['sponsor']."</td>
<td>".$row['minister']."</td>
<td>".$row['confirmation']."</td>
<td>".$row['marriage']."</td>
</tr>";
 }

 
 mysqli_close($con);

?>
</tbody>
</table>
</body>
</html>