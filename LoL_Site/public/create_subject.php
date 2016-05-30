<?php require_once("../includes/session.php"); ?>
<?php require_once("../includes/db_connection.php"); ?>
<?//php require_once("../includes/functions.php"); ?>
<?php include("../includes/Layouts/header.php"); ?>

// <?php 
// if (isset($_POST['submit'])) {
// 	// Process the form

// 	$menu_name = mysql_prep($_POST["menu_name"]);
// 	$position = $_POST["position"];
// 	$visible = $_POST["visible"];

// 	$query  = "INSERT INTO subjects (";
// 	$query .= " menu_name, position, visible";
// 	$query .= ") VALUES (";
// 	$query .= " '{$menu_name}', {$position}, {$visible}";
// 	$query .= ")";
// 	$result = mysqli_query($connection, $query);

// 	if($result) {
// 		// Success
// 		$_SESSION["message"] = "Subject created";
// 		redirect_to("manage_content.php");
// 	} else {
// 		// Failure
// 		$_SESSION["message"] = "Subject creation failed";
// 		redirect_to("new_subject.php");
// 	}
}
?>


<?php  if (isset($connection)) { mysqli_close($connection); } ?>