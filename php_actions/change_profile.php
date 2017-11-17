<?php 
header('Location: ' . $_SERVER['HTTP_REFERER']);

$servername = "localhost";
$username = "root";
$password = "root";

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

$newNickname = $_POST['update_nickname'];
$newSuperpower = $_POST['update_superpower'];
$email = $_POST['email'];


$sql = "UPDATE profile SET nickname = '$newNickname', superpower = '$newSuperpower' WHERE email = '$email'";

$conn->prepare($sql)->execute([$newNickname, $newSuperpower]);
    
?>thank you