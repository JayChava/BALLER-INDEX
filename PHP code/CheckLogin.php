<?php

require_once("connect.php");

// username and password sent from form 
$Email=$_POST['Email']; 
$Password=$_POST['Password']; 

// To protect MySQL injection (more detail about MySQL injection)
$Email = stripslashes($Email);
$Password = stripslashes($Password);
$Email = mysqli_real_escape_string($conn,$Email);
$Password = mysqli_real_escape_string($conn,$Password);

$sql="SELECT Email,Password FROM Logininfo WHERE Email='$Email' and Password='$Password'";


$result=mysqli_query($conn,$sql);


$count=mysqli_num_rows($result);

$sql1="SELECT UserID FROM Logininfo WHERE Email='$Email' and Password='$Password'";
echo $sql1;
$row=mysqli_query($conn,$sql1);
$id=mysqli_fetch_assoc($row);
echo $id["UserID"];
$uid=$id["UserID"];
echo $uid;
if($count==1){

   header("location:HomePage.php?id=".$uid);
   exit();
}
else {
echo "Wrong Username or Password";
}

?>
