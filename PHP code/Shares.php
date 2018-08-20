
<html>
<body>
<?php

require_once("connect.php");
session_start();
$uid = $_GET['id'];
$pid = $_GET['pid'];
 ?>

<form method="post" action="Cart.php?id=<?php echo $uid ?>&pid=<?php echo $pid ?>">
<table width="400" border="0" cellpadding="10" cellspacing="10">
<tr>
<td style="font-weight: bold"><div align="right"><label for="Shares">No of Shares</label></div></td>
<td><input name="Shares" type="integer" class="input" size="25" required /></td>
</tr>
<tr>
<td height="23"></td>
<td><div align="right">
  <input type="submit" name="submit" value="Next"  />
</div></td>
</tr>
</form>
</body>
</html>
