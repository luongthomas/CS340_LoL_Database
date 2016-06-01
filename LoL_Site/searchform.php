<!DOCTYPE  HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta  http-equiv="Content-Type" content="text/html;  charset=iso-8859-1">
    
  </head>
  <p><body>
    <h3>Add/Delete/Search Database</h3>
    <p>Add Champion</p>
	<form  name="addChamp" method="post">
      <input  type="text" name="homeworld" placeholder="Homeworld">
      <input  type="text" name="name" placeholder="Name">
	  <input  type="text" name="damage_type" placeholder="Damage Type">
      <input  type="text" name="role" placeholder="Role">
      <input  type="text" name="item" placeholder="Item">
      <input  type="text" name="lane" placeholder="Lane">
      <input  type="submit" name="addChamp-submit" value="Search">
    </form>

    <p>Add Role</p>	
    <form  name="addRole" method="post" action="search.php?go">
      <input  type="text" name="role" placeholder="Role">
      <input  type="submit" name="addRole-submit" value="Search">
    </form>

    <p>Add Item</p>	
    <form  name="addItem" method="post" action="search.php?go">
      <input  type="text" name="name" placeholder="Item Name">
      <input  type="text" name="description" placeholder="Description">
      <input  type="submit" name="addItem-submit" value="Search">
    </form>

    <p>Add Lane</p>	
    <form  name="addLane" method="post" action="search.php?go">
      <input  type="text" name="name" placeholder="Lane Name">
      <input  type="submit" name="addLane-submit" value="Search">
    </form>

    <p>Add Homeworld</p>	
    <form  name="addHomeworld" method="post" action="search.php?go">
      <input  type="text" name="name" placeholder="Homeworld">
      <input  type="text" name="description" placeholder="Description">
      <input  type="submit" name="addHomeworld-submit" value="Search">
    </form>

    <p>Delete Champion</p>	
    <form  name="deleteChamp" method="post" action="search.php?go">
      <input  type="text" name="name">
      <input  type="submit" name="deleteChamp-submit" value="Search">
    </form>
	
    <p>Search for Champion</p>	
	<form  name="searchDB" method="post" action="search.php?go">
      <input  type="text" name="name">
      <input  type="submit" name="searchDB-submit" value="Search">
    </form>
	
	<?php
	if (!empty($_POST['addChamp-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		$homeworld=$_POST['homeworld']
		$name=$_POST['name']
		$damage_type=$_POST['damage_type']
		$role=$_POST['role']
		$item=$_POST['item']
		$lane=$_POST['lane']
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="BEGIN TRANSACTION 
			DECLARE @homeworld_id int = SELECT homeworld_id FROM Homeworld WHERE homeworld_id = $homeworld;
			INSERT INTO champion (homeworld_id, name, damage_type) VALUES (@homeworld_id, $name, $damage_type);
			DECLARE @champion_id int = SELECT champion_id FROM champion WHERE champion_id = $name;
			DECLARE @role_id int = SELECT role_id FROM Role WHERE role_id = $role;
			INSERT INTO Roles (champion_id, role_id) VALUES (@champion_id, @role_id);
			DECLARE @item_id int = SELECT item_id FROM Item WHERE item_id = $item;
			INSERT INTO Items (item_id, champion_id) VALUES (@item_id, @champion_id);
			DECLARE @lane_id int = SELECT lane_id FROM Lane WHERE lane_id = $lane;
			INSERT INTO Lanes (lane_id, champion_id) VALUES (@lane_id, @champion_id);
		COMMIT";
		echo  "<p>Champion Added</p>";
		}
		}
	}	
	
	if (!empty($_POST['addRole-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		$role=$_POST['role']
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="INSERT INTO Role (role_name)
		VALUES ($role)";
		echo  "<p>Role Added</p>";
		}
		}
	}
	
	if (!empty($_POST['addItem-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name']
		$description=$_POST['description']
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="INSERT INTO Item (item_name)
		VALUES ($name, $description)";
		echo  "<p>Item Added</p>";
		}
		}
	}
	
	if (!empty($_POST['addLane-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name']
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="INSERT INTO Lane (lane_name)
		VALUES ($name)";
		echo  "<p>Lane Added</p>";
		}
		}
	
	}
	
	if (!empty($_POST['addHomeworld-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name']
		$description=$_POST['description']
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="INSERT INTO Homeworld(homeworld_name, homeworld, desc)
		VALUES ($name, $description)";
		echo  "<p>Homeworld Added</p>";
		}
		}
	}
	
	if (!empty($_POST['deleteChamp-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name']
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="DELETE champion ". "WHERE name = $name";
		echo  "<p>Champion Deleted</p>";
		}
		}
	}
	
	if (!empty($_POST['searchDB-submit'])){
		if(isset($_POST['submit'])){
		if(isset($_GET['go'])){
		if(preg_match("/^[  a-zA-Z]+/", $_POST['name'])){
		$name=$_POST['name'];
		//connect  to the database
		$db=mysql_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME) or die ('I cannot connect to the database  because: ' . mysql_error());
		//-select  the database to use
		$mydb=mysql_select_db(DB_SERVER);
		//-query  the database table
		$sql="SELECT name, damage_type, role_name, Homeworld.name, lane_name, item_name FROM Champion INNER 

JOIN Roles on Champion.champion_id = Roles.champion_id INNER JOIN Role ON Roles.role_id = 

Role.role.id INNER JOIN Homeworld ON Champion.homeworld_id = Homeworld.homeworld_id INNER JOIN 

Lanes ON Champion.chamption_id = Lanes.champion_id INNER JOIN Lane ON Lanes.lane_id = 

Lane.lane_id INNER JOIN Items ON Champion.champion_id = Items.item_id INNER JOIN Item ON 

Items.item_id = Item.item_id WHERE Champion.name LIKE '%" . $name . "%'";
		//-run  the query against the mysql query function
		$result=mysql_query($sql);
		//-create  while loop and loop through result set
		while($row=mysql_fetch_array($result)){
          $name  =$row['name'];
          $damage_type=$row['damage_type'];
          $role_name=$row['role_name'];
		  $Homeworld.name=$row['Homeworld.name'];
		  $lane_name=$row['lane_name'];
		  $item_name=$row['item_name'];
		//-display the result of the array
		echo "<ul>\n";
		echo "<li>" . "<a  href=\"search.php?name=$name\">"   .$name . " " . $damage_type .  " "  . $role_name . " " . $Homeworld.name . " " . $lane_name. " " . item_name . "</a></li>\n";
		echo "</ul>";
		}
		}
		else{
		echo  "<p>Please enter a search query</p>";
		}
		}
		}
	}
	
  ?>
  </body>
</html>
</p>