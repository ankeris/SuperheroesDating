<?php 
// Refreshes the webpage
header('Location: ' . $_SERVER['HTTP_REFERER']);


$servername = "localhost";
$username = "root";
$password = "root";

// connecting to localhost with PDO
try {
    $conn = new PDO("mysql:host=$servername;dbname=SuperheroesDating", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully <br>"; 
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

var_dump($_POST);

$likeCount = $_POST['like_count'];
$email = $_POST['email'];

// SQL to update current like_count by adding +1 to it
$sql = "UPDATE profile SET like_count = '$likeCount' + 1 WHERE email = '$email'";

$conn->prepare($sql)->execute([$likeCount]);


?>
