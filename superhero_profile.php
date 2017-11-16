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

foreach ($superheroes as $superhero)
{
?>
<main>
    <h3><?php echo $superhero['nickname']?></h3>
    <img src="<?php echo $superhero['picture']?>" alt="" class="profileImage">
    <p>Superpowers: </p>
    <p>Description: </p>
</main>
<?php
}
?>
<br>
<p><?php 
    
    $sql = $conn->prepare("SELECT email FROM profile WHERE nickname = '$currentname'");
    $sql->execute();
    $email = $sql->fetchAll(); 
    var_dump($email);
    
    ?></p>
<form action="change_profile.php" method="post">
<h4>Change your profile information:</h4>
  Change nickname:<br>
  <input type="text" id="name" name="update_nickname" value="">
  <br>
  Change superpowers:<br>
  <input type="text" name="update_superpower" value="">
  <br><br>
  <!-- <input type="hidden" name="email" value="<?php echo $superheroes['email']?>"/> -->
  <input type="submit" value="Submit">
  
</form> 