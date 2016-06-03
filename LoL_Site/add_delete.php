<?php // require_once("./Includes/session.php"); ?>
<?php require_once("./Includes/db_connection.php"); ?>
<?php require_once("./Includes/functions.php"); ?>
<?php include("./Includes/layouts/header.php"); ?>
<?php //include("./Includes/layouts/body.php"); ?>


<div id="main">

<p><body>
  <h3>Add/Delete/Search Database</h3>
  <p>Add Champion</p>
  <form  name="addChamp" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Name">
    <input  type="text" name="homeworld" placeholder="Homeworld">
    <input  type="text" name="damage_type" placeholder="Damage Type">
    <input  type="text" name="role" placeholder="Role">
    <input  type="text" name="item" placeholder="Item">
    <input  type="text" name="lane" placeholder="Lane">
    <input  type="submit" name="addChamp-submit" value="Add">
  </form>

  <p>Add Role</p>	
  <form  name="addRole" method="post" action="index.php?go">
    <input  type="text" name="role" placeholder="Role">
    <input  type="submit" name="addRole-submit" value="Add">
  </form>

  <p>Add Item</p>	
  <form  name="addItem" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Item Name">
    <input  type="submit" name="addItem-submit" value="Add">
  </form>

  <p>Add Lane</p>	
  <form  name="addLane" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Lane Name">
    <input  type="submit" name="addLane-submit" value="Add">
  </form>

  <p>Add Homeworld</p>	
  <form  name="addHomeworld" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Homeworld">
    <input  type="text" name="description" placeholder="Description">
    <input  type="submit" name="addHomeworld-submit" value="Add">
  </form>

  <p>Delete Champion</p>	
  <form  name="deleteChamp" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Name">
    <input  type="submit" name="deleteChamp-submit" value="Delete">
  </form>

  <p>Search for Champion</p>	
  <form  name="searchDB" method="post" action="index.php?go">
    <input  type="text" name="name" placeholder="Name">
    <input  type="submit" name="searchDB-submit" value="Search">
  </form>

</div>



<?php include("./Includes/layouts/footer.php") ?>