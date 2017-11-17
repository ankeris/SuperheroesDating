<link rel="stylesheet" href="style.css">
<?php

$servername = "localhost";
$username = "root";
$password = "root";

// connection to localhost thru PDO
try {
    $conn = new PDO("mysql:host=$servername;dbname=SuperheroesDating", $username, $password);
    
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

    // gets the information depending on what profile was pressed in main page - index.php
    $currentUser = $_GET['users'];

    // SQL to filter all the data depending on what profile the browser is on
    $sth = $conn->prepare("SELECT * FROM profile WHERE email = '$currentUser'");
    $sth->execute();
    $superheroes = $sth->fetchAll();


?>

<!-- top of the page -->
<a href="./index.php" class="button">Go back to main page</a>

<!-- Loops and fills in the needed profile data-->
<?php
foreach ($superheroes as $superhero)
{ 
?>

<main class="profile">
        <!-- name from DB -->
        <h3><?php echo $superhero['nickname']?></h3>
        <!-- picture from DB -->
        <img src="<?php echo $superhero['picture']?>" alt="" class="profileImage">
        <!-- superpowers from DB -->
        <p>Superpowers: <?php echo $superhero['superpower']?></p>

        <!-- form that displays a button, which if pressed - sends +1 like to database -->
        <form action="php_actions/put_like.php" method="post" style="text-align: center">
            <input type="hidden" name="like_count" value="<?php echo $superhero['like_count']?>"/>
            <!--  send a hidden email for identifying purposes  -->
            <input type="hidden" name="email" value="<?php echo $superhero['email']?>"/>
            <input type="submit" value="Like" onsubmit="window.location.reload()">
            <?php echo $superhero['like_count']?> likes
        </form>
        <br>

    <?php
    }
    ?>


    <!-- form that changes the profile information depending on what data is filled in -->
    <form action="php_actions/change_profile.php" method="post">
        <h4>Change profile information:</h4>
        Change nickname:<br>
        <input type="text" id="name" name="update_nickname" value="">
        <br>
        Change superpowers:<br>
        <input type="text" name="update_superpower" value="">
        <br><br>
        <?php foreach ($superheroes as $superhero) { ?>
            <input type="hidden" name="email" value="<?php echo $superhero['email']?>"/>
        <?php } ?>
        <input type="submit" value="Submit">
    </form> 


<!-- Gets the current name for the comment section -->
<h3><?php foreach ($superheroes as $superhero) { echo $superhero['nickname'];}?>'s Comment section</h3>


<!-- Form that filled in will post a comment -->
<form action="php_actions/post_comment.php" method="POST">
    Post a comment to this profile<br>
    name:<br>
    <input type="text" name="commenter_name" value=""><br>
    <br>
    comment:
    <br>
    <textarea name="comment" cols="50" rows="2"></textarea>
    <!--  send a hidden email for identifying purposes  -->
    <?php foreach ($superheroes as $superhero) { ?>
        <input type="hidden" name="email" value="<?php echo $superhero['email']?>"/>
    <?php } ?>
    <br>
    <input type="submit" value="Send">

</form>

<?php
    
    // Filtering comments from DB to display the current Users profile with SQL
    $comment_sql = $conn->prepare("SELECT * FROM comment WHERE profile_email = '$currentUser'");
    $comment_sql->execute();
    $comments = $comment_sql->fetchAll();

?>

<!-- Filling up every comment in html list -->

<?php
foreach ($comments as $comment) {     
?>
<ul class="comment">
    <li><b>Name: </b> <?php echo $comment['name']?></li>
    <li><b>Wrote: </b><?php echo $comment['comment']?></li>
</ul>


<?php } ?>
</main>