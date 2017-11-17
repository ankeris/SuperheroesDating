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
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

var_dump($_POST);

$values = array(
$_POST['commenter_name'],
$_POST['comment'],
$_POST['email']
);

// SQL that inserts comments written in form to database
$sql = "INSERT INTO comment (name, comment, profile_email) 
VALUES (?,?,?)";

$conn->prepare($sql)->execute($values);

?>
