<!-- Some javascript to go back after 1,2 seconds -->
<script>setTimeout(function(){history.back();}, 1200);</script>
<?php 


$servername = "localhost";
$username = "root";
$password = "root";

// connecting to localhost with PDO
try {
    $conn = new PDO("mysql:host=$servername;dbname=SuperheroesDating", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }


echo "thank you, message has been sent";

// SQL that inserts the data into chat table from form inputs
$sql = "INSERT INTO chat (sender, receiver, message)
VALUES (?,?,?)";

$values = array(
$_POST['sender'],
$_POST['receiver'],
$_POST['message']
);

$conn->prepare($sql)->execute($values);

?>
