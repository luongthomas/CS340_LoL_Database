<?php 

	// function redirect_to($new_location) {
	// 	header("Location: " . $new_location);
	// 	exit;		
	// }

	function message($message) {
		$output  = "<div class=\"message\">";
        $output .= "{$message}";
        $output .= "</div>";

        return $output;
	}


	function mysql_prep($string) {
		global $connection;
		$escaped_string = mysqli_real_escape_string($connection, $string);
		return $escaped_string;
	}

	function confirm_query($result_set) {
		if(!$result_set) {
			// Test if there was a query error
			die("Database query failed.");
		}
	}

	



	function find_all_from($tablename){
		global $connection;

		$query = "SELECT * ";
		$query .= "FROM {$tablename} ";

		$champion_set = mysqli_query($connection, $query);
		confirm_query($champion_set);		
		return $champion_set;
	}



	function print_all_from($tablename){
		$output = "<ul class=\"{$tablename}\">";
		$champion_set = find_all_from($tablename); 			
		while($champion = mysqli_fetch_assoc($champion_set)) {
			$output .= "<li>";

			$output .= $champion["name"];
			
			$output .= "</li>";
		}
		mysqli_free_result($champion_set);
		$output .= "</ul>";
		
		return $output;
	}


?>