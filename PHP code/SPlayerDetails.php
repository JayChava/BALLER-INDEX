<html>
<h1 align='center'> BALLER INDEX </h1>
<body>
<?php

$url = 'ballerindex.png';

?>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-nleg{font-size:14px;font-family:"Lucida Console", Monaco, monospace !important;;text-align:center;vertical-align:top}
</style>

<style type="text/css">
body
{
	background-image:url('<?php echo $url ?>');
    height: 100%; 
    background-position: center;
    background-repeat: repeat;
    background-size: cover;
}

</style>


<?php

require_once("connect.php"); 
$uid=$_GET['id'];
?>
<input type="button" value="Back" onclick="window.location.href='http://localhost/BallerIndex/Playermarket.php?id=<?php echo $uid ?>'" style="width:150px; height:70px;"/>
<table width=50% class="tg" align="center">
<tr>
<th class="tg-nleg"> PlayerId </th>
<th> Player Name </th>
<th> Hieght </th>
<th> Weight </th>
<th> Age </th>
</tr>

<?php
session_start();
require_once("connect.php");



$sql="SELECT PlayerID,PlayerName,Hieght ,Weight ,Age FROM  PlayerMarket Where PlayerMarket.GameTypeID = 1";


$result = mysqli_query($conn,$sql);



if( mysqli_num_rows($result) > 0)
{
	while($row = mysqli_fetch_array($result))
		
	{
		
		echo "<tr>";
		echo"<td>".$row['PlayerID']."</td>";
		echo"<td>".$row['PlayerName']."</td>";
		echo"<td>".$row['Hieght']."</td>";
		echo"<td>".$row['Weight']."</td>";
		echo"<td>".$row['Age']."</td>";
		echo"</tr>";
	}
}
	else
	{
		echo "0rows";
	}
?>



</table>
</body>
 </html>