<?php

require_once("Connect.php");
session_start();
$uid=$_GET['id'];
$pid=$_GET['pid'];

$sql="DELETE FROM CartItems Where CartItems.UserId=$uid AND CartItems.PlayerID=$pid";

$result= mysqli_query($conn,$sql);

header("location:CartView.php?id=".$uid);
?>