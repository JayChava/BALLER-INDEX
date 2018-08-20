<html>
<body>

<?php

 require_once("Connect.php");
 
 
$FirstName = $_POST['FirstName'];
$LastName = $_POST['LastName'];
$Email =$_POST['Email'];
$Password =$_POST['Password'];
$Nationality = $_POST['Nationality'];
$Age = $_POST['Age'];
$SSN = $_POST['SSN'];
$Address = $_POST['Address'];
$Zip = $_POST['Zip'];
$City = $_POST['City'];
$State= $_POST['State'];

$sql1="INSERT INTO Customer (`First Name`,`Last Name`,`Nationality`,`Age`,`SSN`) VALUES ('$FirstName','$LastName','$Nationality','$Age','$SSN')";


echo $sql1;



if ($conn->query($sql1) === TRUE) {
	
	$lastid = mysqli_insert_id($conn);

echo "$lastid";
	
$sql2="INSERT INTO Logininfo (`UserID`,`Email`,`Password`) VALUES ('$lastid','$Email','$Password')";
$sql3="INSERT INTO Address (`UserID`,`Address`,`Zip`) VALUES ('$lastid','$Address','$Zip')";
echo $sql2;
echo $sql3;




if($conn->query($sql2) === TRUE&&$conn->query($sql3) === TRUE){

	echo "New record created successfully";
	
	/*if (mysqli_query($conn,$sql2)) {
    echo "New record created successfully";*/
} 
	}

else 
{
     echo "Error: " . $sql . "<br>" . $conn->error;
} 
  

?>

</body>
</html>