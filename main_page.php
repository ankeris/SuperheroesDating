
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

$sth = $conn->prepare("SELECT * FROM profile");
$sth->execute();

$superheroes = $sth->fetchAll();


foreach ($superheroes as $superhero)
{
?>
    <ul>
        <li>
           
           <a href="superhero_profile.php?users=<?php echo $superhero['nickname'] ?>">
               <p><?php echo $superhero['nickname'], " profile"?></p>
            </a>
            
        </li>
    </ul>
<?php
}
?>
