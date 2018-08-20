<?php
require_once("connect.php");
session_start();
$uid=$_GET['id'];
$pid=$_GET['pid'];

$sql="call spAddWatchlist($pid,'remove',$uid)";

$result=mysqli_query($conn,$sql);

header("location:ViewWatchlist.php?id=".$uid);
?>
