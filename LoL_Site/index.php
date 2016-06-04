<?php chdir(dirname(__FILE__)) ?>
<?php // require_once("./Includes/session.php"); ?>
<?php require_once("./Includes/db_connection.php"); ?>
<?php require_once("./Includes/functions.php"); ?>
<?php include("./Includes/layouts/header.php"); ?>





<div id="main">

	<h1>What would you like to do?</h1>

	<p><a href="show_champions.php">Display all champions</a></p>
	<p><a href="show_items.php">Display all items</a></p>
	<p><a href="show_roles.php">Display all roles</a></p>
	<p><a href="show_lanes.php">Display all lanes</a></p>
	<p><a href="show_homeworlds.php">Display all homeworlds</a></p>



	<p><a href="add_delete.php">Add to the database</a></p>




</div>



<?php include("./Includes/layouts/footer.php") ?>