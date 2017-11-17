<script>setTimeout(function(){history.back();}, 1700);</script>
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


$sender = $_POST['sender'];
$receiver = $_POST['receiver'];
$message = $_POST['message'];

echo "thank you, message has been sent";

$sql = "INSERT INTO chat (sender, receiver, message) VALUES ('$sender','$receiver','$message')";

$conn->prepare($sql)->execute([$sender,$receiver,$message]);

?>
