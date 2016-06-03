<?php  

	define("DB_SERVER", "oniddb.cws.oregonstate.edu");
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
	echo 'Successfully connected to database! Yahoo! \n';



	function confirm_query($result_set) {
		if(!$result_set) {
			// Test if there was a query error
			die("Database query failed.");
		}
	}


	function find_all_champions(){
		global $connection;

		$query = "SELECT * ";
		$query .= "FROM Champion ";

		$champion_set = mysqli_query($connection, $query);
		confirm_query($champion_set);		
		return $champion_set;
	}

	function navigation(){
		$output = "<ul class=\"champions\">";
		$champion_set = find_all_champions(); 			
		while($champion = mysqli_fetch_assoc($champion_set)) {
			$output .= "<li>";

			$output .= $champion["name"];
			
			$output .= "</li>";
		}
		mysqli_free_result($champion_set);
		$output .= "</ul>";
		
		return $output;
	}



	echo navigation();


	if (isset($connection)) {
		echo 'Closing Database';
		mysqli_close($connection);
	}



?>