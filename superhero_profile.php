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

     
    $currentUser = $_GET['users'];
    $sth = $conn->prepare("SELECT * FROM profile WHERE email = '$currentUser'");
    $sth->execute();
    $superheroes = $sth->fetchAll();

    // SQL to get current email
    $sql = $conn->prepare("SELECT email FROM profile WHERE email = '$currentUser'");
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
    <form action="php_actions/put_like.php" method="post">
        <input type="hidden" name="like_count" value="<?php echo $superhero['like_count']?>"/>
        <input type="hidden" name="email" value="<?php echo $currentEmail?>"/>
        <input type="submit" value="Like" onsubmit="window.location.reload()">
        <?php echo $superhero['like_count']?> likes
    </form>

</main>
<?php
}
?>



<form action="php_actions/change_profile.php" method="post">
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

  <h1>Leave a comment!</h1>


<form action="php_actions/post_comment.php" method="POST">
 
  <input type="text" name="commenter_name" value="Your Name"><br>
  
  <textarea name="comment" cols="50" rows="2"></textarea>
  
  <input type="hidden" name="email" value="<?php echo $currentEmail?>"/>
  
  <input type="submit" value="Comment">
  
</form>

<?php
    
    // comment
    $comment_sql = $conn->prepare("SELECT * FROM comment WHERE profile_email = '$currentUser'");
    $comment_sql->execute();
    $comments = $comment_sql->fetchAll();
  
    foreach ($comments as $comment) {     
?>

<ul>
    <li>Name: <?php echo $comment['name']?></li>
    <li><?php echo $comment['comment']?></li>
</ul>


<?php } ?>