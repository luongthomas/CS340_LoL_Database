<!-- If we want to output any messages from our current session -->

<?php  
	session_start();

	function message() {
		if(isset($_SESSION["message"])) {
            $output  = "<div class=\"message\">";
            $output .= htmlentities($_SESSION["message"]);
            $output .= "</div>";

            // clear message after use
            $_SESSION["message"] = null;

            return $output;
        }
	}





?>