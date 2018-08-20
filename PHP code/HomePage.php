<html>
<h1 align='center'>Baller Index</h1>
<?php
session_start();
$uid=$_GET['id'];
$url = 'ballerindex.png';

?>


<style type="text/css">
body
{ 
 
	background-image:url('ballerindex.png');
    height: 100%; 
    background-position: center;
    background-repeat: repeat;
    background-size: cover;
	font-size: 24px;

}

</style>
<body align='center'>

<input type="button" value="Basketball PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/PlayerMarket.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Soccer PlayerMarket" onclick="window.location.href='http://localhost/BallerIndex/SPlayerMarket.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Portfolio" onclick="window.location.href='http://localhost/BallerIndex/ViewPortfolio.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Watchlist" onclick="window.location.href='http://localhost/BallerIndex/ViewWatchlist.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Cart" onclick="window.location.href='http://localhost/BallerIndex/CartView.php?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>
<input type="button" value="Log Out" onclick="window.location.href='http://localhost/BallerIndex/Login.html?id=<?php echo $uid ?>'" style="width:200px; height:70px;"/>

</body>
</html>