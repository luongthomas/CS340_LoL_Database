<?php require_once("./Includes/db_connection.php"); ?>
<?php require_once("./Includes/functions.php"); ?>
<?php include("./Includes/layouts/header.php"); ?>





<?php echo print_all_from("Champion"); ?>


<?php  
	// add ability to update the champion name

	// Taken from Kevin Skoland example
    if (isset($_POST['edit-submit'])) {
      // Process the form

      $new_name = mysql_prep($_POST["champion_name"]);
      $champion_id = mysql_prep($_POST["champion_id"]);

      $query  = "UPDATE Champion ";
      $query .= " SET name = '";
      $query .= " {$new_name}'";
      $query .= " WHERE ";
      $query .= " champion_id = {$champion_id}";
      $result = mysqli_query($connection, $query);
      confirm_query($result);

      echo message("Champion Name Edited, please refresh the page");
    }

//UPDATE Champion SET name='doggy' WHERE champion_id = 132
	
?>

<form method="post" action="show_champions.php">
 	<fieldset>
	    <legend>Update a Champion Name</legend>
		Champion ID:<br>
		<input type="text" name="champion_id" placeholder="champion_id"><br>
		Name to Change to:<br>
		<input type="text" name="champion_name" placeholder="champion_name"><br><br>
		<input type="submit" name="edit-submit" value="edit">
   </fieldset>
</form>





<?php include("./Includes/layouts/footer.php") ?>