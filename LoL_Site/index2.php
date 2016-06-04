<!DOCTYPE  HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta  http-equiv="Content-Type" content="text/html;  charset=iso-8859-1">
    
  </head>
  <p><body>
    <h3>Add/Delete/Search Database</h3>
    <p>Add Champion</p>
    <form  name="addChamp" method="post" action="index2.php?go">
      <input  type="text" name="name" placeholder="Name">
      <input  type="text" name="homeworld" placeholder="Homeworld">
      <input  type="text" name="damage_type" placeholder="Damage Type">
      <input  type="submit" name="addChamp-submit" value="Add">
    </form>

    <p>Add Role to Existing Champion</p>	
    <form  name="addRole" method="post" action="index2.php?go">
      <input  type="text" name="champion" placeholder="Champion's Name">
      <input  type="text" name="role" placeholder="Role">
      <input  type="submit" name="addChampRole-submit" value="Add">
    </form>

    <p>Add Item to Existing Champion</p>	
    <form  name="addRole" method="post" action="index2.php?go">
      <input  type="text" name="champion" placeholder="Champion's Name">
      <input  type="text" name="item" placeholder="Item">
      <input  type="submit" name="addChampItem-submit" value="Add">
    </form>

    <p>Add Lane to Existing Champion</p>	
    <form  name="addRole" method="post" action="index2.php?go">
      <input  type="text" name="champion" placeholder="Champion's Name">
      <input  type="text" name="lane" placeholder="Lane">
      <input  type="submit" name="addChampLane-submit" value="Add">
    </form>

    <p>Add New Role</p>	
    <form  name="addRole" method="post" action="index2.php?go">
      <input  type="text" name="role" placeholder="Role">
      <input  type="submit" name="addRole-submit" value="Add">
    </form>

    <p>Add New Item</p>	
    <form  name="addItem" method="post" action="index2.php?go">
      <input  type="text" name="name" placeholder="Item Name">
      <input  type="submit" name="addItem-submit" value="Add">
    </form>

    <p>Add New Lane</p>	
    <form  name="addLane" method="post" action="index2.php?go">
      <input  type="text" name="name" placeholder="Lane Name">
      <input  type="submit" name="addLane-submit" value="Add">
    </form>

    <p>Add New Homeworld</p>	
    <form  name="addHomeworld" method="post" action="index.php?go">
      <input  type="text" name="name" placeholder="Homeworld">
      <input  type="text" name="description" placeholder="Description">
      <input  type="submit" name="addHomeworld-submit" value="Add">
    </form>

	
    <p>Search for Champion</p>	
    <form  name="searchDB" method="post" action="index2.php?go">
      <input  type="text" name="name" placeholder="Name">
      <input  type="submit" name="searchDB-submit" value="Search">
    </form>
	
	<?php
	define("DB_SERVER", "oniddb.cws.oregonstate.edu");
	define("DB_USER", "luongt-db");
	define("DB_PASS", "nkNtRv7dE7mzDW22");
	define("DB_NAME", "luongt-db");

	if (!empty($_POST['addChamp-submit'])){
		if(isset($_POST['addChamp-submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name'];
		$damage_type=$_POST['damage_type'];
		$homeworld=$_POST['homeworld'];

		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}	

		//-query  the database table
		$query=("INSERT INTO Champion (homeworld_id, name, damage_type) VALUES ((SELECT homeworld_id FROM Homeworld WHERE Homeworld.homeworld_name LIKE '$homeworld'), '$name', '$damage_type')");
		//$retval = mysqli_fetch_object($query)->$homeworld;
		var_dump($query);
		var_dump($homeworld);
		echo "Query Done";
		$result=mysqli_query($conn, $query);
		echo  "Champion Added";

		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	}

	if (!empty($_POST['addChampRole-submit'])){
		if(isset($_POST['addChampRole-submit'])){
		if(isset($_GET['go'])){
		$champion=$_POST['champion'];
		$role=$_POST['role'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}	

		//-query  the database table
		$query="INSERT INTO Roles (champion_id, role_id) VALUES ((SELECT champion_id FROM Champion WHERE name LIKE '$champion'), (SELECT role_id FROM Role WHERE role_name LIKE '$role'))";
		$result=mysqli_query($conn, $query);
		echo  "Role Added";

		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	}


	if (!empty($_POST['addChampItem-submit'])){
		if(isset($_POST['addChampItem-submit'])){
		if(isset($_GET['go'])){
		$champion=$_POST['champion'];
		$item=$_POST['item'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}	

		//-query  the database table
		$query="INSERT INTO Items (item_id, champion_id) VALUES ((SELECT item_id FROM Item WHERE item_name LIKE '$item'), (SELECT champion_id FROM Champion WHERE name LIKE '$champion'))";
		$result=mysqli_query($conn, $query);
		echo  "Item Added";

		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	}


	if (!empty($_POST['addChampLane-submit'])){
		if(isset($_POST['addChampLane-submit'])){
		if(isset($_GET['go'])){
		$champion=$_POST['champion'];
		$lane=$_POST['lane'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}	

		//-query  the database table
		$query="INSERT INTO Lanes (lane_id, champion_id) VALUES ((SELECT lane_id FROM Lane WHERE lane_name LIKE '$lane'), (SELECT champion_id FROM Champion WHERE name LIKE '$champion'))";
		$result=mysqli_query($conn, $query);
		echo  "Role Added";
		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	}


	if (!empty($_POST['addRole-submit'])){
		if(isset($_POST['addRole-submit'])){
		if(isset($_GET['go'])){
		$role=$_POST['role'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}	

		//-query  the database table
		$query="INSERT INTO Role (role_name) VALUES ('$role')";
		$result=mysqli_query($conn, $query);
		echo  "Role Added";

		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	}
	
	if (!empty($_POST['addItem-submit'])){
		if(isset($_POST['addItem-submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}

		//-query  the database table
		$query="INSERT INTO Item (item_name) VALUES ('$name')";
		$result=mysqli_query($conn, $query);
		echo  "Item Added";

		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	}
	
	if (!empty($_POST['addLane-submit'])){
		if(isset($_POST['addLane-submit'])){
		if(isset($_GET['go'])){
		$name=$_POST['name'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}

		//-query  the database table
		$query="INSERT INTO Lane (lane_name) VALUES ('$name')";
		$result=mysqli_query($conn, $query);
		echo  "Lane Added";

		if(isset($conn)) {
			mysqli_close($conn);
		}
		}
		}
	
	}
	
	if (!empty($_POST['addHomeworld-submit'])){
		echo "Adding homeworld";
		if(isset($_POST['addHomeworld-submit'])){
		if(isset($_GET['go'])){

		$name=$_POST['name'];
		$description=$_POST['description'];

		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME); 
		echo "3";
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}

		//-query  the database table
		$query="INSERT INTO Homeworld (homeworld_name, homeworld_desc) VALUES ('$name', '$description')";
		$result=mysqli_query($conn, $query);
		echo $result;
		echo  "Homeworld Added";

		if(isset($conn)) {
			msqli_close($conn);
		}
		}
		}
		
	}
	

	
	if (!empty($_POST['searchDB-submit'])){
		if(isset($_POST['searchDB-submit'])){
		if(isset($_GET['go'])){
		if(preg_match("/^[  a-zA-Z]+/", $_POST['name'])){
		$name=$_POST['name'];
		//connect  to the database
		$conn=mysqli_connect  (DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		if ($conn->connect_errno){
		echo "connection failed: ".$conn->connect_error."\n";
		exit();
		}

		//-query  the database table
		$query="SELECT DISTINCT name, damage_type, role_name, homeworld_name, lane_name, item_name FROM Champion INNER JOIN Roles on Champion.champion_id = Roles.champion_id INNER JOIN Role ON Roles.role_id = Role.role_id INNER JOIN Homeworld ON Champion.homeworld_id = Homeworld.homeworld_id INNER JOIN Lanes ON Champion.champion_id = Lanes.champion_id INNER JOIN Lane ON Lanes.lane_id = Lane.lane_id INNER JOIN Items ON Champion.champion_id = Items.champion_id INNER JOIN Item ON Items.item_id = Item.item_id WHERE Champion.name LIKE '$name'";
		//-run  the query against the mysql query function

		$result=mysqli_query($conn,$query, MYSQLI_USE_RESULT);

		// create a table for the results
		echo "<table border='1'>
		<tr>
		<th>  Champion  </th>
		<th>  Damage Type  </th>
		<th>  Role Name  </th>
		<th>  Homeworld  </th>
		<th>  Lane  </th>
		<th>  Item  </th>
		</tr>";
		
		// loop through results and display
		while($row=mysqli_fetch_assoc($result)){

			echo "<tr>"; //th
			echo "<td>" . $row['name'] . "</td>"; //td
          	  	echo "<td>" . $row['damage_type'] . "</td>";
          	  	echo "<td>" . $row['role_name'] . "</td>";
		  	echo "<td>" . $row['homeworld_name'] . "</td>";
		  	echo "<td>" . $row['lane_name'] . "</td>";
			echo "<td>" . $row['item_name'] . "</td>";
		

		}

		mysqli_free_result($result);
		echo "</table>";
		
		if(isset($conn)) {
			mysqli_close($conn);
		}

		
		}
		}
		}
	}
	
  ?>
  </body>
</html>
</p>
