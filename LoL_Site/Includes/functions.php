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
		$query_set = find_all_from($tablename); 			
		while($query = mysqli_fetch_assoc($query_set)) {
			$output .= "<li>";

			// Since champion's names only have "name"
			if($tablename == "Champion") {
				$output .= $query["name"];
			}	else {

				$tablename_lower = strtolower($tablename);
				$output .= $query["{$tablename_lower}_name"];
			}



			$output .= "</li>";
		}
		mysqli_free_result($query_set);
		$output .= "</ul>";
		
		return $output;
	}


?>