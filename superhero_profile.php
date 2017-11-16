<link rel="stylesheet" href="style.css">
<?php
$servername = "localhost";
$username = "root";
$password = "root";

try {
    $conn = new PDO("mysql:host=$servername;dbname=SuperheroesDating", $username, $password);
    
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

    // stores the file name 
    $currentname = $_GET['users'];
    $sth = $conn->prepare("SELECT * FROM profile WHERE nickname = '$currentname'");
    $sth->execute();
    $superheroes = $sth->fetchAll();

    // SQL to get current email
    $sql = $conn->prepare("SELECT email FROM profile WHERE nickname = '$currentname'");
    $sql->execute();
    $fetch = $sql->fetchAll(); 
    $currentEmail = $fetch[0]['email'];

foreach ($superheroes as $superhero)
{
?>


<main>
    <h3><?php echo $superhero['nickname']?></h3>
    <img src="<?php echo $superhero['picture']?>" alt="" class="profileImage">
    <p>Superpowers: <?php echo $superhero['superpower']?></p>
    <form action="like.php" method="post">
        <input type="hidden" name="like_count" value="<?php echo $superhero['like_count']?>"/>
        <input type="hidden" name="email" value="<?php echo $currentEmail?>"/>
        <input type="submit" value="Like">
        <?php echo $superhero['like_count']?> likes
    </form>

</main>
<?php
}
?>
<br>
<?php 

   /* // SQL to get likes from DB
    $like = $conn->prepare("SELECT like_count FROM profile WHERE nickname = '$currentname'");
    $like->execute();
    $fetchLikes = $like->fetchAll(); 
    $likes = $fetchLikes[0]['like_count'];
    echo $likes;
    */
?>
<form action="change_profile.php" method="post">
<h4>Change your profile information:</h4>
  Change nickname:<br>
  <input type="text" id="name" name="update_nickname" value="">
  <br>
  Change superpowers:<br>
  <input type="text" name="update_superpower" value="">
  <br><br>
  <input type="hidden" name="email" value="<?php echo $currentEmail?>"/>
  <input type="submit" value="Submit">
  
</form> 