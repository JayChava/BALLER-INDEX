<html>
<h1 align='center' color='white'> BALLER INDEX </h1>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-nleg{font-size:14px;font-family:"Lucida Console", Monaco, monospace !important;;text-align:center;vertical-align:top}
</style>

<body align='center'>

<?php
require_once("connect.php");
session_start();
$uid=$_GET['id'];
$pid=$_GET['pid'];
$shares=$_GET['shares'];


$sql="call SPupdateorder($uid)";

$sql="call spAddtoPortfolio($uid,$pid,$shares)";

$result=mysqli_query($conn,$sql);

header("location:ViewPortfolio.php?id=".$uid);
?>