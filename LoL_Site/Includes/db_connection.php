<?php  

	define("DB_SERVER", "mpx-snip-483.onid.oregonstate.edu");
	define("DB_USER", "luongt-db");
	define("DB_PASS", "nkNtRv7dE7mzDW22");
	define("DB_NAME", "luongt-db");
	// 1. Create a database connection

	// handle to the connection 
	$connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
	// Test if connection occurred.
	if(mysqli_connect_errno()) {
		die("Database conenction failed: " . 
			mysqli_connect_error() . 
			" (" . mysqli_connect_errno() . ")"
		);
	}
?>