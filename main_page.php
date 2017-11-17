
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
           
           <a href="superhero_profile.php?users=<?php echo $superhero['email'] ?>">
               <p><?php echo $superhero['nickname'], " profile"?></p>
            </a>
            
        </li>
    </ul>
<?php
}
?>

<?php
$chat = $conn->prepare("SELECT * FROM profile");
$chat->execute();

$chatters = $chat->fetchAll();


?>

<form action="php_actions/send_private_message.php" method="post">
    sender:
    <select name="sender" id="" value="">
       <?php foreach ($chatters as $chatter) { ?>
            <option value="<?php echo $chatter['email'] ?>"><?php echo $chatter['nickname'] ?></option>
        <?php } ?>
    </select><br>
    receiver:
    <select name="receiver" id="">
        <?php foreach ($chatters as $chatter) { ?>
            <option value="<?php echo $chatter['email'] ?>"><?php echo $chatter['nickname'] ?></option>
        <?php } ?>
    </select><br>
    message:
    <input type="text" name="message">
    
    <input type="submit" value="Send">
</form>


