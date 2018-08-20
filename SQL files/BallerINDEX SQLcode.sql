create database ballerindex;
use ballerindex;


CREATE TABLE `State`(
  `Zip` integer(7) NOT NULL,
  `City` Varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  primary key (`Zip`)
);


CREATE TABLE `Address` (
   `UserID` integer(5) NOT NULL auto_increment,
  `Address` varchar(50) NOT NULL,
  `Zip` integer(7) NOT NULL,
  foreign key (`UserID`) references Customer(`UserID`),
  foreign key (`Zip`) references State(`Zip`)
);


CREATE TABLE `Customer` (
  `UserID` integer(5) NOT NULL auto_increment,
`first name` varchar(20) NOT NULL,
  `Last Name` varchar(20)NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  `Age` integer NOT NULL,
  `SSN` varchar(50) NOT NULL,
  primary key (`UserID`)
);

SET foreign_key_checks = 0;

SET foreign_key_checks = 1;

CREATE TABLE `Logininfo` (
  `UserID` integer(5) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(15) NOT NULL,
  primary key (`UserID`,`Email`),
  foreign key (`UserID`) references `Customer` (`UserID`)
);


CREATE TABLE `Bank` (
  `BankID` integer(5) NOT NULL auto_increment,
  `UserID` integer(5) NOT NULL,
  `Name on Card` varchar(50) NOT NULL,
  `Card NO` double NOT NULL,
  `Expiry Date` date NOT NULL,
  primary key (`BankID`),
  foreign key (`UserID`) references `Customer`(`UserID`)
);


 create table `GameType` (
 `GameTypeID` integer(5) NOT NULL,
 `GameType` nvarchar(20),
 primary key (`GameTypeID`));
 
 
create table `StatsType` (
`StatsTypeID` integer(5) NOT NULL,
`StatsType` nvarchar(20), 
primary key (`StatsTypeID`));


CREATE TABLE `PlayerMarket` (
  `PlayerID` integer(5) NOT NULL auto_increment,
  `GameTypeID` integer(5) NOT NULL,
 `PlayerName` varchar(50) NOT NULL,
  `Height` numeric(4,2) NOT NULL,
  `Weight` numeric(4,2) NOT NULL,
  `Age` integer(5) NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  primary key (`PlayerID`),
  foreign key (`GameTypeID`) references `GameType`(`GameTypeID`)
);


CREATE TABLE `Price` (
  `PriceID` integer(5) NOT NULL auto_increment,
  `PlayerID` integer(5) NOT NULL,
  `BuyRate` numeric(7,2) NOT NULL,
  `SellRate` numeric(7,2) NOT NULL,
  primary key (`PriceID`),
  foreign key (`PlayerID`) references `PlayerMarket`(`PlayerID`));


SET foreign_key_checks = 0;

SET foreign_key_checks = 1;

 
create table `portfolio`(
`PortfolioID` integer(5) NOT NULL auto_increment,
`UserID` integer(5) NOT NULL,
primary key (`PortfolioID`),
foreign key (`UserID`) references customer(`UserID`));
       

 CREATE TABLE  `PortfolioItems` (
  `PortfolioItemID` integer(5) NOT NULL auto_increment,
  `PortfolioID` integer(5) NOT NULL,
  `PlayerID` integer(5) NOT NULL,
  `No of shares` integer(5) NOT NULL,
  `PriceID` integer(5) NOT NULL,
  `Profits` numeric(10,2),
  `UserID` integer(5), 
  primary key(`PortfolioItemID`),
  foreign key (`UserID`) references `Customer` (`UserID`),
  foreign key (`PlayerID`) references `PlayerMarket` (`PlayerID`),
  foreign key (`PriceID`) references `Price` (`PriceID`),
  foreign key(`PortfolioID`) references portfolio(`PortfolioID`)
);

create table `Cart`(
    `CartID` integer(5) not null auto_increment, 
    `UserID` integer(5) not null,
    primary key(`CartID`),
    foreign key(`UserID`) references `Customer` (`UserID`));

CREATE TABLE `CartItems` (
  `CartItemsID` integer(5) NOT NULL auto_increment,
  `CartID` integer(5) not null,
  `UserID` integer(5) NOT NULL,
  `PlayerID` integer(5) NOT NULL,
  `Buy Rate` numeric(7,2) NOT NULL,
  `NoofShares` integer(5) NOT NULL,
  `Amount` integer(20) NOT NULL,
  `orderplaced` varchar(50) NOT NULL,
  primary key (`CartItemsID`),
   foreign key(`CartID`) references `Cart` (`CartID`),
  foreign key(`UserID`) references `Customer` (`UserID`),
  foreign key (`PlayerID`) references `PlayerMarket` (`PlayerID`)
);


CREATE TABLE `Orders` (
  `OrderID` integer(5) NOT NULL auto_increment,
  `CartID` integer(5) NOT NULL,
  `UserID` integer(5) NOT NULL,
  `TotalAmount` integer(20) NOT NULL,
  `WalletID` integer(5) NOT NULL,
  primary key (`OrderID`),
  foreign key (`UserID`) references `Customer` (`UserID`),
   foreign key (`CartID`) references `Cart` (`CartID`) , 
   foreign key (`WalletID`) references `Wallet` (`WalletID`)
);


CREATE TABLE `Wallet` (
  `WalletID` integer(5) NOT NULL auto_increment,
  `UserID` integer(5) NOT NULL,
  `Balance` integer(5) NOT NULL,
  primary key (`WalletID`),
  foreign key (`UserID`) references `Customer` (`UserID`)
);


CREATE TABLE `Watchlist` (
  `WatchlistID` integer(5) NOT NULL auto_increment,
  `UserID` integer(5) NOT NULL,
  primary key (`WatchlistID`),
  foreign key (`UserID`) references `Customer` (`UserID`)
  );

create table `WatchlistItems` (
`WatchlistItemID` integer(5) NOT NULL auto_increment,
`WatchlistID` integer(5) NOT NULL,
`PlayerID` integer(5) NOT NULL,
`UserID` integer(5) NOT NULL,
`PriceID` integer(5) NOT NULL,
primary key(`WatchlistItemID`),
foreign key(`UserID`) references `Customer` (`UserID`),
foreign key (`PlayerID`) references `PlayerMarket` (`PlayerID`),
  foreign key (`PriceID`) references `Price` (`PriceID`),
  foreign key(`WatchlistID`) references `watchlist`(`WatchlistID`)
);


CREATE TABLE `Selling` (
  `sellingorderId` integer(5) NOT NULL auto_increment,
  `UserID` integer(5) NOT NULL,
  `PlayerID` integer(5) NOT NULL,
  `Sell rate` integer(5) NOT NULL ,
  `Noofshares` integer(5) NOT NULL,
  `Amountearned` integer(10) NOT NULL,
  `WalletID` integer(10) NOT NULL,
  primary key (`sellingorderId`),
foreign key (`WalletID`) references `Wallet` (`WalletID`),
foreign key (`UserID`) references `Customer` (`UserID`),
foreign key (`PlayerID`) references `PlayerMarket` (`PlayerID`)
);

 CREATE TABLE `fstats` (
  `StatsTypeID` integer(5) ,
  `PlayerID` integer(5),
  `FstatsID` integer(5) not null auto_increment ,
  `goals` numeric(7,2) not null,
  `assists` numeric(7,2) not null,
  `Saves` numeric(7,2) NOT NULL,
  `Interceptions` numeric(7,2) NOT NULL,
  `Clearances` numeric(7,2) NOT NULL,
  `Blocks` numeric(7,2) NOT NULL,
  `GoalsConceded` numeric(7,2) NOT NULL,
  `YellowCard` numeric(7,2) NOT NULL,
  `Redcard` numeric(7,2) NOT NULL,
  `PenaltyMissed` numeric(7,2) NOT NULL,
  `OwnGoal` numeric(7,2) NOT NULL,
  `Minutesplayed/90` numeric(7,2) NOT NULL,
  `PassPercentage` numeric(7,2) NOT NULL,
  `CleanSheet` integer(5) NOT NULL,
   primary key (`BstatsID`),
   foreign key (`PlayerID`) references `playermarket` (`PlayerID`),
   foreign key (`StatsTypeID`) references `StatsType` (`StatsTypeID`)
  );
 

 CREATE TABLE `Bstats` (
  `StatsTypeID` integer(5) ,
  `PlayerID` integer(5),
  `BstatsID` integer(5) not null auto_increment ,
  `Points` numeric(7,2) NOT NULL,
  `Rebounds` numeric(7,2) NOT NULL,
  `Assists` numeric(7,2) NOT NULL,
  `Steals` numeric(7,2) NOT NULL,
  `Blocks` numeric(7,2) NOT NULL,
  `3pointersmade` numeric(7,2) NOT NULL,
  `FG%` numeric(7,2) NOT NULL,
  `FT%` numeric(7,2) NOT NULL,
  `3PFG%`numeric(7,2) NOT NULL, 
  `Turnovers` numeric(7,2) NOT NULL,
  `PersonalFouls` numeric(7,2) NOT NULL,
   primary key (`BstatsID`),
   foreign key (`PlayerID`) references `playermarket` (`PlayerID`),
    foreign key (`StatsTypeID`) references `StatsType` (`StatsTypeID`)
  );

/*customer details view*/

Create VIEW ballerindex1.`CUSTOMER_DETAILS` as 
select 
customer.UserID,
customer.`First Name`,
customer.`Last Name`,
customer.Nationality,
customer.age,
Address.Address,
state.zip,
state.state 
from ballerindex1.Customer inner join ballerindex1.address
on customer.UserID=address.UserID
inner join ballerindex1.state on state.zip=address.Zip;

DELIMITER $$
create procedure ballerindex1.spviewcustomer(in ipuser integer(5))
BEGIN
select * from ballerindex1.`customer_details` where `customer_details`.UserID=ipuser;
end$$
Delimiter :

select*from customer_details;

/*stored procedure for signup*/

delimiter $$
CREATE procedure ballerindex1.SpSignUp(in
`iemail` varchar(100),
`ipassword` varchar(15),
`iname on card` varchar(20), 
`icard no` integer(16), 
`iexpiry date` date,
iaddress varchar(20), 
izip integer(7),
icity varchar(20), 
istate varchar(20), 
`ifirst name` varchar(20), 
`ilast name` varchar(20),
 inationality varchar(20),
 iage integer(5), 
 iSSN integer(15))

BEGIN
DECLARE msg VARCHAR(25);
IF exists( select email from logininfo where logininfo.email = iemail)
	then set msg = 'USER ALREADY EXISTS';
else
	INSERT into `bank`(`bankid`, `name on card`, `card no`, `expiry date`)
		values (null, `iname on card`, `icard no`, `iexpiry date`);
	insert into `address`(address, zip)
		values (iaddress, izip);
		insert into `customer`  (`userid`, `first name`, `last name`, `nationality`,`age`, `ssn`)
		values (null,`iFirst Name`, `iLast Namesp`, `inationality`, `iDOB`,`issn`);
	insert into `state` (state, city)
		values (`istate`, `icity`);
	Insert into `logininfo`(`email`, `password`)
		values (`iemail`, `ipassword`);

		     
End if;

End $$
Delimiter ;


/*store procedure for playermarket view*/

Delimiter $$
create procedure spViewPlayerName (in igametypeID nvarchar(20))
begin
select 
PlayerMarket.PlayerName,
PlayerMarket.Height, 
PlayerMarket.Weight, 
PlayerMarket.Age, 
Price.BuyRate,
Price.SellRate
from Ballerindex1.PlayerMarket 
inner join Ballerindex1.Price 
on PlayerMarket.PlayerID=Price.PlayerID
inner join Ballerindex1.gametype on gametype.GameTypeid=playermarket.GameTypeID
where playermarket.GameTypeID=igametypeID;
end$$
delimiter ;

/* stored procedure for player name and his details */

delimiter $$

Create PROCEDURE ballerindex1.spPlayerName(in ipPlayerName varchar(20))
BEGIN
declare a varchar(50);
set  a = (select gametype from playermarket inner join
 gametype on GameType.GameTypeid=playermarket.GameTypeID where playername=ipPlayername);
If  a = 'basketball' then

select 
playermarket.playername, 
playermarket.height,
playermarket.weight, 
playermarket.age, 
gametype.gametype,
bstats.points, 
bstats.rebounds,
bstats.assists, 
bstats.steals,
bstats.blocks,
bstats.`3pointersmade`,
bstats.`FG%`,
bstats.`3PFG%`,
bstats.turnovers,
bstats.personalfouls
from playermarket inner join gametype on playermarket.GameTypeID=gametype.GameTypeID 
inner join bstats on playermarket.playerID=bstats.playerID
where playermarket.playername = ipPlayerName;
else

select
playermarket.playername, 
playermarket.height, 
playermarket.weight, 
playermarket.age, 
gametype.gametype,
fstats.`goals`,
fstats.`assists`,
fstats.`saves`,
fstats.`interceptions`, 
fstats.`clearances`, 
fstats.`blocks`, 
fstats.`goalsconceded`, 
fstats.`yellowcard`, 
fstats.`redcard`, 
fstats.`penaltymissed`,
fstats.`owngoal`, 
fstats.`minutesplayed/90`, 
fstats.`passpercentage`, 
fstats.`cleansheet` 
from playermarket inner join gametype on playermarket.GameTypeID=gametype.GameTypeID 
inner join fstats on playermarket.playerID=fstats.playerID
where playermarket.playername = ipPlayerName;

end if;

end$$
Delimiter ;

/* creating users and privileges*/

create user soumya identified by 'baller';
grant all privileges on ballerindex1 to soumya;
grant select, insert , update on ballerindex1.* to systemadmin;
grant select,insert,delete on ballerindex.customer to soumya; 
grant select,insert on ballerindex to soumya;
create user user_account identified by 'qwerty';
create user admin@localhost identified by 'ballerindex';
grant all on *.* to admin@localhost with grant option;
show grants for admin@localhost;
revoke all privileges, grant option from admin@localhost;
show grants for admin@localhost;
grant select, update , delete on ballerindex1.* to admin@localhost;
create user Mainadmin@localhost identified by 'root';
grant all on *.* to Mainadmin@localhost with grant option;
show grants for user_account;
grant all on Ballerindex.* to Mainadmin@localhost with grant option;
grant insert , update on ballerindex1.Customer to user_account;
grant insert , update on ballerindex1.PortfolioItems to user_account;
grant insert , update on ballerindex1.CartItems to user_account;
revoke all privileges , grant option from user_account;
grant select on ballerindex1.Customer to user_account; 
grant select on ballerindex1.PortfolioItems to user_account;
grant select on ballerindex1.CartItems to user_account;
grant select on ballerindex1.WatchlistItems to user_account;
grant select on ballerindex1.playermarket to user_account; 


/* stored procedure for adding money to wallet */

delimiter $$
create procedure `spAddMoney` (in ipuserid integer(5), ipAddRemove varchar(6), ipAmount integer(5))
BEGIN
declare a integer(50);
declare msg varchar(50);
set  a = (select walletID from wallet where userid = ipuserid);
If  ipAddRemove = 'Add' or 'add' or 'ADD' then
update ballerindex1.wallet set balance = balance + ipAmount where userid = ipuserid;
elseif ipAddRemove = 'Remove' or 'remove' or 'REMOVE' then
update ballerindex1.wallet set balance = balance - ipAmount where userid = ipuserid;
else
select msg;
end if;

end$$

Delimiter ;

/*price determining procedure for basketball*/


delimiter $$
create procedure `SPnewpriceB` (in iplayerID int(10))
begin

declare a integer(2);
declare vpts decimal(5,2);
declare vast decimal(5,2);
declare vrebs decimal(5,2);
declare v3pm decimal(5,2);
declare vstl decimal(5,2);
declare vblk decimal(5,2);
declare vfg decimal(5,2);
declare vft decimal(5,2);
declare v3fg decimal(5,2);
declare vtov decimal(5,2);
declare vpf decimal(5,2);
declare vpts1 decimal(5,2);
declare vast1 decimal(5,2);
declare vrebs1 decimal(5,2);
declare v3pm1 decimal(5,2);
declare vstl1 decimal(5,2);
declare vblk1 decimal(5,2);
declare vfg1 decimal(5,2);
declare vft1 decimal(5,2);
declare vtov1 decimal(5,2);
declare vpf1 decimal(5,2);
declare v3fg1 decimal(5,2);
declare vpri decimal(5,2);
declare vsec decimal(5,2);
declare vper decimal(5,2);
declare vneg decimal(5,2);
declare vpri1 decimal(5,2);
declare vsec1 decimal(5,2);
declare vper1 decimal(5,2);
declare vneg1 decimal(5,2);
declare changeinprice decimal(5,2);
declare currentprice decimal(5,2);
declare newsellprice decimal(5,2);
set a=(select playerMarket.GametypeID from playermarket where playerID=iPlayerID);
if a=2 then 
set vpts = (select bstats.points from bstats where playerID=iplayerID and statstypeid = 1);
set vast = (select bstats.assists from bstats where playerID=iplayerID and statstypeid = 1);
set vrebs = (select bstats.rebounds from bstats where playerID=iplayerID and statstypeid = 1);
set v3pm = (select bstats.`3pointersmade` from bstats where playerID=iplayerID and statstypeid = 1);
set vfg = (select bstats.`FG%` from bstats where playerID=iplayerID and statstypeid = 1);
set vft = (select bstats.`FT%` from bstats where playerID=iplayerID and statstypeid = 1);
set v3fg = (select bstats.`3PFG%` from bstats where playerID=iplayerID and statstypeid = 1);
set vtov = (select bstats.Turnovers from bstats where playerID=iplayerID and statstypeid = 1);
set vpf = (select bstats.PersonalFouls from bstats where playerID=iplayerID and statstypeid = 1);
set vstl = (select bstats.Steals from bstats where playerID=iplayerID and statstypeid = 1);
set vblk = (select bstats.Blocks from bstats where playerID=iplayerID and statstypeid = 1);
set vpts1 = (select bstats.points from bstats where playerID=iplayerID and statstypeid = 2);
set vast1 = (select bstats.assists from bstats where playerID=iplayerID and statstypeid = 2);
set vrebs1 = (select bstats.rebounds from bstats where playerID=iplayerID and statstypeid = 2);
set v3pm1 = (select bstats.`3pointersmade` from bstats where playerID=iplayerID and statstypeid = 2);
set vfg1 = (select bstats.`FG%` from bstats where playerID=iplayerID and statstypeid = 2);
set vft1 = (select bstats.`FT%` from bstats where playerID=iplayerID and statstypeid = 2);
set v3fg1 = (select bstats.`3PFG%` from bstats where playerID=iplayerID and statstypeid = 2);
set vtov1 = (select bstats.Turnovers from bstats where playerID=iplayerID and statstypeid = 2);
set vpf1 = (select bstats.PersonalFouls from bstats where playerID=iplayerID and statstypeid = 2);
set vstl1 = (select bstats.Steals from bstats where playerID=iplayerID and statstypeid = 2);
set vblk1 = (select bstats.Blocks from bstats where playerID=iplayerID and statstypeid = 2);
set vpri = (vpts+vast+vrebs);
set vsec = (v3pm+vstl+vblk);
set vper = (vfg+vft+v3fg);
set vneg = (vtov+vpf);
set vpri1 = (vpts1+vast1+vrebs1);
set vsec1 = (v3pm1+vstl1+vblk1);
set vper1 = (vfg1+vft1+v3fg1);
set vneg1 = (vtov1+vpf1);
set vpri = (vpri-vpri1)*0.2;
set vsec = (vsec-vsec1)*0.2;
set vper = (vper-vper1)/100;
set vneg = (vneg-vneg1)*0.2;
set changeinprice = (vpri+vsec+vper+vneg);
set currentprice = (select price.buyrate from price where playerID=iplayerID);
set currentprice = (currentprice+changeinprice);
update price set buyrate=currentprice where playerID=iplayerID;
set newsellprice = (select price.SellRate from price where playerID=iplayerID);
set newsellprice = (newsellprice+changeinprice);
update price set sellrate=newsellprice where playerID=iplayerID;
select currentprice;

end if; 
end$$
delimiter ;


/* price determining algorithm for soccer*/

delimiter $$
create procedure `SPnewpriceF` (in iplayerID int(10))
begin
declare a integer(2);
declare vgls decimal(5,2);
declare vast decimal(5,2);
declare vsav decimal(5,2);
declare vint decimal(5,2);
declare vclr decimal(5,2);
declare vblk decimal(5,2);
declare vgc decimal(5,2);
declare vyc decimal(5,2);
declare vrc decimal(5,2);
declare vpm decimal(5,2);
declare vog decimal(5,2);
declare vmp decimal(5,2);
declare vppe decimal(5,2);
declare vcs decimal(5,2);
declare vgls1 decimal(5,2);
declare vast1 decimal(5,2);
declare vsav1 decimal(5,2);
declare vint1 decimal(5,2);
declare vclr1 decimal(5,2);
declare vblk1 decimal(5,2);
declare vgc1 decimal(5,2);
declare vyc1 decimal(5,2);
declare vrc1 decimal(5,2);
declare vpm1 decimal(5,2);
declare vog1 decimal(5,2);
declare vmp1 decimal(5,2);
declare vppe1 decimal(5,2);
declare vcs1 decimal(5,2);
declare vpri decimal(5,2);
declare vsec decimal(5,2);
declare vper decimal(5,2);
declare vneg decimal(5,2);
declare vbon decimal(5,2);
declare vpri1 decimal(5,2);
declare vsec1 decimal(5,2);
declare vper1 decimal(5,2);
declare vneg1 decimal(5,2);
declare vbon1 decimal (5,2);
declare changeinprice decimal(5,2);
declare currentprice decimal(5,2);
declare newsellprice decimal(5,2);
set a=(select playerMarket.GametypeID from playermarket where playerID=iPlayerID);
if a=1 then 
set vgls = (select fstats.goals from fstats where playerID=iplayerID and statstypeid = 1);
set vast = (select fstats.assists from fstats where playerID=iplayerID and statstypeid = 1);
set vsav = (select fstats.saves from fstats where playerID=iplayerID and statstypeid = 1);
set vint = (select fstats.Interceptions from fstats where playerID=iplayerID and statstypeid = 1);
set vclr = (select fstats.Clearances from fstats where playerID=iplayerID and statstypeid = 1);
set vblk = (select fstats.Blocks from fstats where playerID=iplayerID and statstypeid = 1);
set vgc = (select fstats.GoalsConceded from fstats where playerID=iplayerID and statstypeid = 1);
set vyc = (select fstats.YellowCard from fstats where playerID=iplayerID and statstypeid = 1);
set vrc = (select fstats.Redcard from fstats where playerID=iplayerID and statstypeid = 1);
set vpm = (select fstats.PenaltyMissed from fstats where playerID=iplayerID and statstypeid = 1);
set vog = (select fstats.OwnGoal from fstats where playerID=iplayerID and statstypeid = 1);
set vmp = (select fstats.`Minutesplayed/90` from fstats where playerID=iplayerID and statstypeid = 1);
set vppe = (select fstats.PassPercentage from fstats where playerID=iplayerID and statstypeid = 1);
set vcs = (select fstats.CleanSheet from fstats where playerID=iplayerID and statstypeid = 1);
set vgls1 = (select fstats.goals from fstats where playerID=iplayerID and statstypeid = 2);
set vast1 = (select fstats.assists from fstats where playerID=iplayerID and statstypeid = 2);
set vsav1 = (select fstats.saves from fstats where playerID=iplayerID and statstypeid = 2);
set vint1 = (select fstats.Interceptions from fstats where playerID=iplayerID and statstypeid = 2);
set vclr1 = (select fstats.Clearances from fstats where playerID=iplayerID and statstypeid = 2);
set vblk1 = (select fstats.Blocks from fstats where playerID=iplayerID and statstypeid = 2);
set vgc1 = (select fstats.GoalsConceded from fstats where playerID=iplayerID and statstypeid = 2);
set vyc1 = (select fstats.YellowCard from fstats where playerID=iplayerID and statstypeid = 2);
set vrc1 = (select fstats.Redcard from fstats where playerID=iplayerID and statstypeid = 2);
set vpm1 = (select fstats.PenaltyMissed from fstats where playerID=iplayerID and statstypeid = 2);
set vog1 = (select fstats.OwnGoal from fstats where playerID=iplayerID and statstypeid = 2);
set vmp1 = (select fstats.`Minutesplayed/90` from fstats where playerID=iplayerID and statstypeid = 2);
set vppe1 = (select fstats.PassPercentage from fstats where playerID=iplayerID and statstypeid = 2);
set vcs1 = (select fstats.CleanSheet from fstats where playerID=iplayerID and statstypeid = 2);
set vpri = (vgls+vast);
set vsec = (vsav+vint+vclr+vblk+vgc);
set vper = (vmp+vppe);
set vneg = (vyc+vrc+vpm+vog);
set vbon = (vcs);
set vpri1 = (vgls1+vast1);
set vsec1 = (vsav1+vint1+vclr1+vblk1+vgc1);
set vper1 = (vmp1+vppe1);
set vneg1 = (vyc1+vrc1+vpm1+vog1);
set vbon1 = (vcs1);
set vpri = (vpri-vpri1)*0.5;
set vsec = (vsec-vsec1)*0.3;
set vper = (vper-vper1)/100;
set vneg = (vneg-vneg1)*0.2;
set vbon = (vbon-vbon1)*0.1;
set changeinprice = (vpri+vsec+vper+vneg);
set currentprice = (select price.buyrate from price where playerID=iplayerID);
set currentprice = (currentprice+changeinprice);
select changeinprice;
update price set buyrate=currentprice where playerID=iplayerID;
set newsellprice = (select price.SellRate from price where playerID=iplayerID);
set newsellprice = (newsellprice+changeinprice);
update price set sellrate=newsellprice where playerID=iplayerID;
select currentprice;

end if; 
end$$
delimiter ;


/* sprocedure for adding stock to cart*/

delimiter @@
create procedure spAddtocart(`iUserID` integer(5),`iPlayerID` integer(5),`inoofshares` integer(5))
Begin
declare cid integer(5);
declare pric integer(5);
set cid=(select CartID from Cart where cart.UserID=iUserID);
set pric= (select price.BuyRate from price where PriceID=(
select PriceID from price where price.playerID=iplayerID));
insert into CartItems values(null,cid,iUserID,iPlayerID,inoofshares,pric*inoofshares,null);
end@@

delimiter ;
 

/* updating order store procedure*/

delimiter $$
create procedure SPupdateorder(`iUserID` integer(5))
begin
declare c integer(10);
declare a decimal(7,2);
declare w integer(10);
declare b decimal(7,2);
set c=(select distinct(CartID) from cartitems where cartitems.UserID=iUserID);
set a=(select sum(Amount) from  cartitems where cartitems.UserID=iUserID);
set w=(select WalletID from wallet where wallet.UserID=iUserID);
insert into orders values(null,c,iUserID,a,w);
update cartitems set orderplaced = 'yes' where cartitems.UserID=iUserID;
set b=(select balance from wallet where wallet.UserID=iUserID);
set a= (b-a);
update wallet set balance=a where wallet.UserID=UserID;
end$$ 
delimiter ;

/*add to watchlist store procedure */


delimiter $$
create procedure spAddWatchlist (in iplayerid integer(5), iaddremove varchar(10), iuserid integer(5))
begin
declare addremove varchar(10);
declare currentprice decimal(5);
declare watchlistidv integer(5);
declare p integer(5);
set watchlistidv = (select watchlistid from watchlist where watchlist.UserID = iuserid);
set p = (select priceID from price where price.PlayerID=iplayerID);
If  iaddremove = 'Add' or 'add' or 'ADD' then
insert into watchlistitems
values (null,watchlistidv, iplayerid, iuserid, p);
elseif iAddRemove = 'Remove' or 'remove' or 'REMOVE' then
delete from watchlistitems where watchlistitems.PlayerID = iplayerid and watchlistitems.UserID = iuserid;

end if;
end$$ 
 delimiter ;

/* signup store procedure */

delimiter $$
CREATE procedure SpSignUp(
 in`iemail` varchar(100),
 `ipassword` varchar(15),
 `iname on card` varchar(20), 
`icard no` integer(16), 
`iexpiry date` date,
`iaddress` varchar(20), 
`izip` integer(7),
`ifirst name` varchar(20), 
`ilast name` varchar(20),
`inationality` varchar(20),
`iage` integer(5), 
`iSSN` integer(15))

BEGIN
DECLARE msg VARCHAR(25);
declare data1 integer;
IF exists( select email from logininfo where logininfo.email = iemail)
	then set msg = 'USER ALREADY EXISTS';
    select msg;
else
    insert into `customer` values (null,`iFirst Name`, `iLast Name`, `inationality`, `iage`,`issn`);
        set data1=last_insert_id();
        insert into `address`values (data1,`iaddress`, `izip`);
	INSERT into `bank`values (null,data1, `iname on card`, `icard no`, `iexpiry date`);
    Insert into `logininfo`values (data1,`iemail`, `ipassword`);
    insert into `portfolio` values(null,data1);
    insert into `cart` values(null,data1);
    insert into `watchlist` values(null,data1);
    insert into `wallet` values(null,data1,0);
    
 End if;
End $$
Delimiter ; 

/*store procedure for selling */
 
 DELIMITER $$
CREATE PROCEDURE `SpSelling`(`iuserid`integer (5), `iplayerid` integer (5), `inoofshares` integer (5))
    BEGIN
	declare profitloss decimal (7,3);
    declare uid integer(5);
    declare pid integer (5);
    declare nos integer(5);
    declare avgrate decimal(7,3);
    declare sllrate decimal(7,3);
    declare diff decimal (7,3);
    declare wallID integer(5);
    declare samount decimal(7,3);
    declare tprice decimal(7,3);
    set nos = (select `No of shares`-inoofshares from portfolioitems
    where portfolioitems.UserID=iUserID and portfolioitems.playerID=iplayerID);
	set avgrate= (select AvgBuyRate from portfolioitems
    where  portfolioitems.UserID=iUserID and portfolioitems.playerID=iplayerID);
    set wallID=(select walletID from wallet where userID=iuserID);
    set sllrate = (select SellRate from price where playerid= iplayerid);
    set diff= inoofshares*(sllrate-avgrate);
    set samount=sllrate*inoofshares;
    set tprice=nos*sllrate;    
    insert into selling values(null,iuserID,iplayerID,inoofshares,diff,wallID);
    
    update wallet set balance = `balance`+ samount where userid= iuserid;
    update portfolioitems set `no of shares` = nos ,totalstockprice=tprice 
    where playerid= iplayerid and userID=iUserID;
    END $$
DELIMITER ;

/* store procedure for adding to portfolio */

delimiter $$
create procedure spAddtoPortfolio(`iUserID` integer(5),`iPlayerID` integer(5),`inoofshares` integer(5))
begin
declare msg varchar(20);
declare pid integer(5);
declare pric decimal(5,2);
declare pricid integer(5);
declare tprice decimal(7,3);
declare newnoofshares integer(5);
declare ibuyrate decimal(7,3);
declare spric decimal(7,3);
set pid=(select portfolioID from portfolio where portfolio.UserID=iUserID);
set pric= (select price.BuyRate from price where PriceID=(
select PriceID from price where price.playerID=iplayerID));
set pricid=(select PriceID from price where price.playerID=iplayerID);

set spric= (select price.SellRate from price where PriceID=(
select PriceID from price where price.playerID=iplayerID));


if 
exists(select portfolioItems.playerID from portfolioitems where portfolioItems.playerID=iplayerID and userID=iUserID)
then
set newnoofshares=(select `no of shares`+inoofshares from portfolioitems where  PlayerID=iplayerID and UserID=iUserID); 
set tprice=spric*newnoofshares;
set ibuyrate=(select AvgBuyRate from portfolioitems where  PlayerID=iplayerID and UserID=iUserID);

set ibuyrate=(ibuyrate+pric)/2;

update portfolioitems set `No of shares`=`newnoofshares`,`totalstockprice`= tprice,`AvgBuyRate`=ibuyrate
 where  PlayerID=iplayerID and UserID=iUserID;
else
set newnoofshares=`inoofshares`;
set tprice= pric*newnoofshares;
insert into portfolioitems values(null,pid,iplayerID,newnoofshares,pric,tprice,pricid,`iUserID`);

end if;
end$$
delimiter ;

/*trigger for selling */

delimiter @@
create trigger trigger_selling
after insert on selling 
for each row
begin
declare sid integer(5);
declare uid integer(5);
set sid=(select max(sellingorderId) from selling);
set uid=(select UserID from selling where sellingorderID=sid);

delete from portfolioitems where  UserID=uid and portfolioitems.`No of shares`=0;
end@@

delimiter ;

/*trigger for adding to portfolio */

delimiter !!
create trigger triggeraddportfolio
after insert on orders 
for each row 
begin
declare cid integer(5);
declare uid integer(5);
declare pid integer(5);
declare nos integer(5);
declare oid integer(5);
declare notfound integer default 0;
DECLARE cur1 CURSOR FOR SELECT cartitemsID FROM cartItems WHERE userID=3;

DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET notfound = 1;
open cur1;
get_details:loop
fetch cur1 into cid;
set uid=(select UserID from cartitems where cartitemsID=cid);
set pid=(select playerID from cartitems where cartitemsID=cid);
set nos=(select noofshares from cartitems where cartitemsID=cid);
call spaddtoportfolio(uid,pid,nos);
if notfound=1
then
leave get_details;
end if;
end loop get_details;
close cur1;
end !!
delimiter ;
