<?php
require_once("connect.php");
session_start();
$uid=$_GET['id'];

$sql="call spViewWatchlist($uid)";

$result=mysqli_query($conn,$sql);?>

<html>

<body align='center'>
<input type="button" value="Basketball PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/PlayerMarket.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Soccer PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/SPlayerMarket.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Portfolio" onclick="window.location.href='http://localhost/BallerIndex/ViewPortfolio.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Cart" onclick="window.location.href='http://localhost/BallerIndex/CartView.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Log Out" onclick="window.location.href='http://localhost/BallerIndex/Login.html?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-nleg{font-size:14px;font-family:"Lucida Console", Monaco, monospace !important;;text-align:center;vertical-align:top}
</style>

<table width="50%" class="tg" align="center">
<tr>
<td class="tg-nleg"> PlayerID </td>
<td> Player Name </td>
<td> Buy Rate </td>
<td> Sell Rate</td>
<tr>
<?php

if( mysqli_num_rows($result) > 0)
	
{
  while($row = mysqli_fetch_array($result))
		
	{
		
		echo "<tr>";
		$pid=$row['PlayerID'];
		echo"<td>".$row['PlayerID']."</td>";
		echo"<td>".$row['PlayerName']."</td>";
		echo"<td>".$row['Currentprice']."</td>";
		echo"<td>".$row['Sell rate']."</td>";?>
		<td> <input type="button" value="Add to Cart" onclick="window.location.href='http://localhost/BallerIndex/Shares.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>'"/></td>
		<td> <input type="button" value="Delete" onclick="window.location.href='http://localhost/BallerIndex/DeleteWatchlist.php?id=<?php echo $uid ?>&pid=<?php echo $pid  ?>'" /></td>
		<?php
		echo"</tr>";
	
	}
}
	else
	{
		echo "0rows";
	}


?>
</table>
<input type="button" value="Back" onclick="window.location.href='http://localhost/BallerIndex/Playermarket.php?id=<?php echo $uid ?>'" style="width:100px; height:40px;"/>

</body>
</html>