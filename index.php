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

$sth = $conn->prepare("SELECT * FROM profile");
$sth->execute();
$superheroes = $sth->fetchAll();
?>
<main class="homepage">
<h1>Super Heroes Dating</h1>

<h4>profiles:</h4>
<?php 
foreach ($superheroes as $superhero)
{
?>
    <ul>
        <li>
            <!-- href that stores email value in "?users" and sends it to the click profile. So it can identify -->
           <a href="superhero_profile.php?users=<?php echo $superhero['email'] ?>">
               <p><?php echo $superhero['nickname'], " profile"?></p>
            </a>
        </li>
    </ul>
<?php
}
?>

<!-- Form that lets to select from who to who message should be sent -->
<form action="php_actions/send_private_message.php" method="post">
    <h4>messenger</h4>
    sender:
    <select name="sender" id="">
    <!--  Loops and fills in the possible profiles -->
       <?php foreach ($superheroes as $chatter) { ?>
            <!-- Value is sent by the nickname that is selected, sends the email value instead of nickname, because it's unique -->
            <option value="<?php echo $chatter['email'] ?>"><?php echo $chatter['nickname'] ?></option>
        <?php } ?>
    </select>
    <br>
    receiver:
    <select name="receiver" id="">
        <?php foreach ($superheroes as $chatter) { ?>
            <option value="<?php echo $chatter['email'] ?>"><?php echo $chatter['nickname'] ?></option>
        <?php } ?>
    </select>
    <br>
    message:
    <input type="text" name="message">
    
    <input type="submit" value="Send">
</form>

</main>

