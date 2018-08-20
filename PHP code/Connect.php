<?php
$host = "localhost";
$userName = "root";
$password = "SreyaReddy6@";
$dbName = "BallerIndex";
 
// Create database connection
$conn = mysqli_connect ($host, $userName, $password, $dbName);
 
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
else {
	echo("Connected");
}
?>