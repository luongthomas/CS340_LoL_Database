<?php 


	// Outputs a boxed message, used to show if a query was successful
	function message($message) {
		$output  = "<div class=\"message\">";
        $output .= "{$message}";
        $output .= "</div>";

        return $output;
	}

	// Used to prevent SQL Injection
	function mysql_prep($string) {
		global $connection;
		$escaped_string = mysqli_real_escape_string($connection, $string);
		return $escaped_string;
	}

	// Test if there was a query error
	function confirm_query($result_set) {
		if(!$result_set) {
	
			die("Database query failed.");
		}
	}

	


	// Takes in a table name and outputs all entries from the table
	function find_all_from($tablename){
		global $connection;

		$query = "SELECT * ";
		$query .= "FROM {$tablename} ";

		$champion_set = mysqli_query($connection, $query);
		confirm_query($champion_set);		
		return $champion_set;
	}


	// Given table name, it prints out all the entries from the set
	function print_all_from($tablename){
		$output = "<ul class=\"{$tablename}\">";
		$query_set = find_all_from($tablename); 			
		while($query = mysqli_fetch_assoc($query_set)) {
			$output .= "<li>";

			// Since champion's names only have "name"
			// Adds images next to their names
			if($tablename == "Champion") {
				$output .= "{$query["champion_id"]}. {$query["name"]}";
				$output .= " <img src='http://ddragon.leagueoflegends.com/cdn/6.11.1/img/champion/";
				
				// Removes spaces from the name, fixes Xin Zhao
				$str = str_replace(' ', '', $query['name']);
				$str = mysql_prep($str);
				$output .= "{$str}";
				// $output .= "{$query['name']}";
				$output .= ".png' class='icon'>";
			}	else {

				$tablename_lower = strtolower($tablename);
				$output .= $query["{$tablename_lower}_name"];

				if($tablename == "Homeworld") {
					$output .= "<ul class='homeworld_desc'><li>";
					$output .= "{$query['homeworld_desc']}";
					$output .= "</li></ul><br>";

				}
			}



			$output .= "</li>";
		}
		mysqli_free_result($query_set);
		$output .= "</ul>";
		
		return $output;
	}


?>