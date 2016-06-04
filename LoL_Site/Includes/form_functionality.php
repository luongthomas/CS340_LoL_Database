<?php

function form_submit()
{
    global $connection;
    
    if (!empty($_POST['addChamp-submit'])) {
        if (isset($_POST['addChamp-submit'])) {
            if (isset($_GET['go'])) {
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
    }
    
    if (!empty($_POST['addRole-submit'])) {
        if (isset($_POST['addRole-submit'])) {
            if (isset($_GET['go'])) {
                $role = $_POST['role'];
                
                
                //-select  the database to use
                //$mydb=mysqli_select_db(DB_SERVER);
                //-query  the database table
                $query  = "INSERT INTO Role (role_name) VALUES ('$role')";
                $result = mysqli_query($connection, $query);
                echo "Role Added";
                
                
            }
        }
    }
    
    if (!empty($_POST['addItem-submit'])) {
        if (isset($_POST['addItem-submit'])) {
            if (isset($_GET['go'])) {
                $name        = $_POST['name'];
                $description = $_POST['description'];
                
                //-query  the database table
                $query  = "INSERT INTO Item (item_name) VALUES ('$name', '$description')";
                $result = mysqli_query($connection, $query);
                echo "Item Added";
                
                
            }
        }
    }
    
    if (!empty($_POST['addLane-submit'])) {
        if (isset($_POST['addLane-submit'])) {
            if (isset($_GET['go'])) {
                $name = $_POST['name'];
                
                //-query  the database table
                $query  = "INSERT INTO Lane (lane_name) VALUES ('$name')";
                $result = mysqli_query($connection, $query);
                echo "Lane Added";
                
                
            }
        }
        
    }
    
    if (!empty($_POST['addHomeworld-submit'])) {
        echo "Adding homeworld";
        if (isset($_POST['addHomeworld-submit'])) {
            if (isset($_GET['go'])) {
                echo "1";
                $name        = $_POST['name'];
                $description = $_POST['description'];
                echo "2";
                
                
                
                //-select  the database to use
                //$mydb=mysqli_select_db(DB_SERVER);
                //-query  the database table
                //$query="INSERT INTO Homeworld" . "(homeworld_name, homeworld_desc)" . "VALUES ('$name', '$description')";
                echo "4";
                $query  = "INSERT INTO Homeworld (homeworld_name, homeworld_desc) VALUES ('$name', '$description')";
                $result = mysqli_query($connection, $query);
                echo $result;
                echo "Homeworld Added";
                
            }
        }
        
    }
    
    if (!empty($_POST['deleteChamp-submit'])) {
        if (isset($_POST['deleteChamp-submit'])) {
            if (isset($_GET['go'])) {
                $name = $_POST['name'];
                
                
                //-select  the database to use
                //$mydb=mysqli_select_db(DB_SERVER);
                //-query  the database table
                $query  = "DELETE champion WHERE name = '$name'";
                $result = mysqli_query($connection, $query);
                echo "Champion Deleted";
                
                
            }
        }
    }
    
    if (!empty($_POST['searchDB-submit'])) {
        if (isset($_POST['searchDB-submit'])) {
            if (isset($_GET['go'])) {
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
    }
}

?>