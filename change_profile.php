<?php 

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
/*
$nickname = $_POST['update_nickname'];
$superpower = $_POST['update_superpower'];

$sql = "UPDATE profile SET nickname = '$nickname' WHERE email = ";

$conn->prepare($sql)->execute([$nickname, $superpower]);

  
    
?>thank you