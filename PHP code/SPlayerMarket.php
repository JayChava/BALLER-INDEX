<html>
<h1 align='center' color='white'> BALLER INDEX </h1>
<body align='center'>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-nleg{font-size:14px;font-family:"Lucida Console", Monaco, monospace !important;;text-align:center;vertical-align:top}
</style>


<?php

$url = 'ballerindex.png';

?>

<?php 
session_start();
require_once("connect.php"); 
$uid=$_GET['id'];

?>


<input type="button" value="Player Details" onclick="window.location.href='http://localhost/BallerIndex/SPlayerDetails.php?id=<?php echo $uid ?>'" style="width:150px; height:70px;" />
<input type="button" value="Basketball PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/SPlayerMarket.php?id=<?php echo $uid ?>'" style="width:150px; height:70px;"/>
<input type="button" value="Portfolio" onclick="window.location.href='http://localhost/BallerIndex/ViewPortfolio.php?id=<?php echo $uid ?>'" style="width:150px; height:70px;"/>
<input type="button" value="Watchlist" onclick="window.location.href='http://localhost/BallerIndex/ViewWatchlist.php?id=<?php echo $uid ?>'" style="width:150px; height:70px;"/>
<input type="button" value="Cart" onclick="window.location.href='http://localhost/BallerIndex/CartView.php?id=<?php echo $uid ?>'" style="width:150px; height:70px;"/>
<input type="button" value="Log Out" onclick="window.location.href='http://localhost/BallerIndex/Login.html?id=<?php echo $uid ?>'" style="width:150px; height:70px;"/>



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

<table width=50% class="tg" align='center'>
<tr>
<th class="tg-nleg"> PlayerID</th>
<th>Player Name </th>
<th> Buy Rate</th>
<th> Sell Rate</th>

<?php




$sql = "SELECT  PlayerMarket.PlayerID,PlayerName,`Buy Rate`,`Sell rate` FROM PlayerMarket INNER JOIN Price ON PlayerMarket.PlayerID=Price.PriceID where PlayerMarket.GameTypeID=1";

$result= mysqli_query($conn,$sql);

if( mysqli_num_rows($result) > 0)
{
	
while($row = mysqli_fetch_array($result) ) 
{
	 echo"<tr>";
	 $pid=$row['PlayerID'];
	 echo "<td>".$row['PlayerID']."</td>";
	 echo "<td>".$row['PlayerName']."</td>";
	 echo "<td>".$row['Buy Rate']."</td>";
	 echo "<td>".$row['Sell rate']."</td>";?>
	<td> <input type="button" value="Add to Cart" onclick="window.location.href='http://localhost/BallerIndex/Shares.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>'"/></td>
	<td> <input type="button" value="Add to Watchlist" onclick="window.location.href='http://localhost/BallerIndex/AddWAtchlist.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>'"/></td>
    <?php echo "</tr>";

 }
 
 
}
else

 {
	 echo "0 rows";
 }

if (!$result) {
	die ('SQL Error: ' . mysqli_error($conn));
}
?>

</table>
 </body>

</html>

