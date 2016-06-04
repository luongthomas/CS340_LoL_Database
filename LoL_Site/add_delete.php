<?php chdir(dirname(__FILE__)) ?>
<?php require_once("./Includes/session.php"); ?>
<?php require_once("./Includes/db_connection.php"); ?>
<?php require_once("./Includes/functions.php"); ?>
<?php include("./Includes/layouts/header.php"); ?>



<div id="main">

<p><body>
  <h3>Add/Delete/Search Database</h3>
  <p>Add Champion</p>
  <form  name="addChamp" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Name">
    <input  type="text" name="homeworld" placeholder="Homeworld">
    <input  type="text" name="damage_type" placeholder="Damage Type">
    <input  type="text" name="role" placeholder="Role">
    <input  type="text" name="item" placeholder="Item">
    <input  type="text" name="lane" placeholder="Lane">
    <input  type="submit" name="addChamp-submit" value="Add">
  </form>


<!-- important that the input field name is correct, for php to select it's value -->

  <p>Add Role</p>	
  <form  name="addRole" method="post" action="">
    <input  type="text" name="role_name" placeholder="Role">
    <input  type="submit" name="addRole-submit" value="Add">
  </form>

  <p>Add Item</p>	
  <form  name="addItem" method="post" action="">
    <input  type="text" name="item_name" placeholder="Item Name">
    <input  type="submit" name="addItem-submit" value="Add">
  </form>

  <p>Add Lane</p>	
  <form  name="addLane" method="post" action="">
    <input  type="text" name="lane_name" placeholder="Lane Name">
    <input  type="submit" name="addLane-submit" value="Add">
  </form>

  <p>Add Homeworld</p>	
  <form  name="addHomeworld" method="post" action="">
    <input  type="text" name="homeworld_name" placeholder="Homeworld">
    <input  type="text" name="homeworld_desc" placeholder="Description">
    <input  type="submit" name="addHomeworld-submit" value="Add">
  </form>


  <p>Search for Champion</p>	
  <form  name="searchDB" method="post" action="">
    <input  type="text" name="champion_name" placeholder="Name">
    <input  type="submit" name="searchDB-submit" value="Search">
  </form>

</div>

<p><a href="index.php">Back to the main page</a></p>



<?php

    
    if (!empty($_POST['addChamp-submit'])) {
        if (isset($_POST['addChamp-submit'])) {
                $homeworld   = $_POST['homeworld'];
                $name        = $_POST['name'];
                $damage_type = $_POST['damage_type'];
                $role        = $_POST['role'];
                $item        = $_POST['item'];
                $lane        = $_POST['lane'];
                
                
                //-select  the database to use
                //$mydb=mysqli_select_db(DB_SERVER);
                //-query  the database table
                $query  = "BEGIN TRANSACTION 
                        DECLARE @newChampID INT;
                        
                        DECLARE @homeworld_id int = SELECT homeworld_id FROM Homeworld WHERE homeworld_id = $homeworld;
                        INSERT INTO champion (homeworld_id, name, damage_type) VALUES (@homeworld_id, '$name', '$damage_type');
                        SELECT @newChampID = SCOPE_IDENTITY();
                        DECLARE @champion_id int = SELECT champion_id FROM champion WHERE champion_id = '$name';
                        DECLARE @role_id int = SELECT role_id FROM Role WHERE role_id = '$role';
                        INSERT INTO Roles (champion_id, role_id) VALUES (@champion_id, @role_id);
                        DECLARE @item_id int = SELECT item_id FROM Item WHERE item_id = '$item';
                        INSERT INTO Items (item_id, champion_id) VALUES (@item_id, @champion_id);
                        DECLARE @lane_id int = SELECT lane_id FROM Lane WHERE lane_id = '$lane';
                        INSERT INTO Lanes (lane_id, champion_id) VALUES (@lane_id, @champion_id);
                    COMMIT";
                $result = mysqli_query($connection, $query);
                echo "Champion Added";
              
            
        }
    }
    

    // Taken from Skoland example
    if (isset($_POST['addRole-submit'])) {
      // Process the form

      $role = mysql_prep($_POST["role_name"]);

      $query  = "INSERT INTO Role (";
      $query .= " role_name";
      $query .= ") VALUES (";
      $query .= " '{$role}'";
      $query .= ")";
      $result = mysqli_query($connection, $query);

      echo message("Role added");
    }



    if (isset($_POST['addItem-submit'])) {
      // Process the form

      $item_name = mysql_prep($_POST["item_name"]);

      $query  = "INSERT INTO Item (";
      $query .= " item_name";
      $query .= ") VALUES (";
      $query .= " '{$item_name}'";
      $query .= ")";
      $result = mysqli_query($connection, $query);

      echo message("Item added");
    }



    if (isset($_POST['addLane-submit'])) {
      // Process the form

      $lane_name = mysql_prep($_POST["lane_name"]);

      $query  = "INSERT INTO Lane (";
      $query .= " lane_name";
      $query .= ") VALUES (";
      $query .= " '{$lane_name}'";
      $query .= ")";
      $result = mysqli_query($connection, $query);

      echo message("Lane added");
    }

    
    if (isset($_POST['addHomeworld-submit'])) {
      // Process the form

      $homeworld_name = mysql_prep($_POST["homeworld_name"]);
      $homeworld_desc = mysql_prep($_POST["homeworld_desc"]);

      $query  = "INSERT INTO Homeworld (";
      $query .= " homeworld_name, homeworld_desc";
      $query .= ") VALUES (";
      $query .= " '{$homeworld_name}', '{$homeworld_desc}'";
      $query .= ")";
      $result = mysqli_query($connection, $query);

      echo message("Homeworld added");
    }





    
    if (!empty($_POST['searchDB-submit'])) {
        if (isset($_POST['searchDB-submit'])) {
                if (preg_match("/^[  a-zA-Z]+/", $_POST['name'])) {
                    $name = $_POST['name'];
                    
                    
                    //-select  the database to use
                    //$mydb=mysqli_select_db(DB_SERVER);
                    //-query  the database table
                    //echo "Before query\n";
                    $query = "SELECT DISTINCT name, damage_type, role_name, homeworld_name, lane_name, item_name FROM Champion INNER JOIN Roles on Champion.champion_id = Roles.champion_id INNER JOIN Role ON Roles.role_id = Role.role_id INNER JOIN Homeworld ON Champion.homeworld_id = Homeworld.homeworld_id INNER JOIN Lanes ON Champion.champion_id = Lanes.champion_id INNER JOIN Lane ON Lanes.lane_id = Lane.lane_id INNER JOIN Items ON Champion.champion_id = Items.champion_id INNER JOIN Item ON Items.item_id = Item.item_id WHERE Champion.name LIKE '$name'";
                    //-run  the query against the mysql query function
                    //echo "after query\n";
                    
                    
                    $result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);
                    //if(!$result){
                    //  echo "Could not find champion!\n";
                    
                    //}
                    //-create  while loop and loop through result set
                    //echo "starting to loop through result\n";
                    //echo "$result\n";
                    
                    
                    
                    echo "<table border='1'>
                            <tr>
                            <th>  Champion  </th>
                            <th>  Damage Type  </th>
                            <th>  Role Name  </th>
                            <th>  Homeworld  </th>
                            <th>  Lane  </th>
                            <th>  Item  </th>
                            </tr>";
                    
                    while ($row = mysqli_fetch_assoc($result)) {
                        
                        /*
                        $name=$row['name'];
                        $damage_type=$row['damage_type'];
                        $role_name=$row['role_name'];
                        $homeworld_name=$row['homeworld_name'];
                        $lane_name=$row['lane_name'];
                        $item_name=$row['item_name'];   
                        */
                        
                        
                        echo "<tr>"; //th
                        echo "<td>" . $row['name'] . "</td>"; //td
                        echo "<td>" . $row['damage_type'] . "</td>";
                        echo "<td>" . $row['role_name'] . "</td>";
                        echo "<td>" . $row['homeworld_name'] . "</td>";
                        echo "<td>" . $row['lane_name'] . "</td>";
                        echo "<td>" . $row['item_name'] . "</td>";
                        
                        
                        
                        
                        //$item_name=$row['item_name'];
                    }
                    //-display the result of the array
                    
                    
                    mysqli_free_result($result);
                    echo "</table>";
                    
                    
                    
                }
                //else{
                //echo  "Please enter a search query";
                //}
            
        }
    }


?>











<?php include("./Includes/layouts/footer.php") ?>



