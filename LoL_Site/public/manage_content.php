<?php require_once("../includes/session.php"); ?>
<?php require_once("../includes/db_connection.php"); ?>
<?php //require_once("../includes/functions.php"); ?>
<?php //include("../includes/Layouts/header.php"); ?>

<?php //find_selected_page(); ?>

<div id="main">
    <div id="navigation">
   		<?php //echo navigation($current_subject, $current_page); ?>
   		<br />
   		<a href="new_subject.php">+ Add a subject</a>
    </div>
    <div id="page">
    	<?php //echo message(); ?>
    	<?php //if($current_subject) { ?>
    		<h2>Manage Content</h2>
    		Menu name: <?php //echo $current_subject['menu_name']; ?><br />

    	<?php // } elseif ($current_page) { ?>
    		<h2>Manage Page</h2>
    		Page name: <?php //echo $current_page['menu_name']; ?><br />

    	<?php// } else { ?>
    		Please select a subject or a page.
    	<?php //} ?>
    </div>
</div>



<?php //include("../includes/Layouts/footer.php") ?>

