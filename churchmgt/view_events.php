<!DOCTYPE html>
<html>
<body>

<h1> VIEW EVENTS </h1>
<a href="index.php">Home</a>

<table border="1" >
<thead>
<tr>
<th>event_id </th>
<th>event_type </th>
<th>event_title </th>
<th>event_desc </th>
<th>event_text </th>
<th>event_start </th>
<th>event_end </th>
</tr>
</thead>
<tbody>
<?php
$con=mysqli_connect("localhost","root","","churchmgt");
if (mysqli_connect_errno()) {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
 }
 
 $result = mysqli_query($con,"SELECT * FROM events");

 while($row = mysqli_fetch_array($result)) {
  // echo $row['event_id'] . " " . $row['event_type']." " . $row['event_title']." " . $row['event_desc']." " . $row['event_text']." " . $row['event_start']." " . $row['event_end'];
   //echo "<br>";
   
   echo "<tr>
<td>".$row['event_id']." <a href='event_edit.php?event_id=".$row['event_id']."'>edit</a></td>
<td>".$row['event_type']."</td>
<td>".$row['event_title']."</td>
<td>".$row['event_desc']."</td>
<td>".$row['event_text']."</td>
<td>".$row['event_start']."</td>
<td>".$row['event_end']."</td>
</tr>";
 }

 
 mysqli_close($con);

?>
</tbody>
</table>
</body>
</html>