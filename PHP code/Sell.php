<?php 
require_once("connect.php");
session_start();
$uid=$_GET['id'];
$pid=$_GET['pid'];
$Shares=$_POST['Shares'];

$sql= "call SpSelling($uid,$pid,$Shares)";

$result= mysqli_query($conn,$sql);

header("location:ViewPortfolio.php?id=". $uid);
?>
