<?php
require_once("Connect.php");

session_start();
$uid=$_GET['id'];

$sql1="call spviewcart($uid)";


$view = mysqli_query($conn,$sql1);

?>
<html>
<body align='center'>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-nleg{font-size:14px;font-family:"Lucida Console", Monaco, monospace !important;;text-align:center;vertical-align:top}
</style>
<input type="button" value="Basketball PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/PlayerMarket.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Soccer PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/SPlayerMarket.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Portfolio" onclick="window.location.href='http://localhost/BallerIndex/ViewPortfolio.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Watchlist" onclick="window.location.href='http://localhost/BallerIndex/ViewWatchlist.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Log Out" onclick="window.location.href='http://localhost/BallerIndex/Login.html?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>


<table width="50%" class="tg" align="center">
<tr>
<td class="tg-nleg"> PlayerID </td>
<td> PlayerName </td>
<td> Buy Rate </td>
<td> No of Shares</td>
<td> Amount </td>
<tr>
<?php

if( mysqli_num_rows($view) > 0)
	
{

	while($row = mysqli_fetch_array($view))
		
	{
		
		echo "<tr>";
		$pid=$row['PlayerID'];
		echo"<td>".$row['PlayerID']."</td>";
		echo"<td>".$row['Playername']."</td>";
		echo"<td>".$row['Buy Rate']."</td>";
		$shares=$row['noofshares'];
		echo"<td>".$row['noofshares']."</td>";
		echo"<td>".$row['Amount']."</td>";?>
		<td> <input type="button" value="Delete" onclick="window.location.href='http://localhost/BallerIndex/DeleteCart.php?id=<?php echo $uid ?>&pid=<?php echo $pid  ?>'" /></td>
		<td><input type="button" value="Checkout " onclick="window.location.href='http://localhost/BallerIndex/Portfolio.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>&shares=<?php echo $shares ?>'"/></td>
		<?php
		echo"</tr>";
	
	}?>
	<input type="button" value="Checkout " onclick="window.location.href='http://localhost/BallerIndex/Portfolio.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>&shares=<?php echo $shares ?>'" style="width:150px; height:70px;"/>

<?}
	else
	{
		echo "0rows";?>
		<input type="button" value="Checkout " onclick="window.location.href='http://localhost/BallerIndex/Portfolio.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>'" style="width:150px; height:70px;"/>

	<?php }


?>
</table>
<input type="button" value="Back" onclick="window.location.href='http://localhost/BallerIndex/HomePage.php?id=<?php echo $uid ?>'" style="width:100px; height:40px;"/>

</html>