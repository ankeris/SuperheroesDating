<?php 
header('Location: ' . $_SERVER['HTTP_REFERER']);

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

var_dump($_POST);

$commenter = $_POST['commenter_name'];
$comment = $_POST['comment'];
$email = $_POST['email'];

$sql = "INSERT INTO comment (name, comment, profile_email) VALUES ('$commenter','$comment','$email')";

$conn->prepare($sql)->execute([$commenter,$comment,$email]);

?>