<script>
window.setTimeout(function() {
    window.history.go(-1);
  }, 1000);
</script>
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

$likeCount = $_POST['like_count'];
$email = $_POST['email'];


$sql = "UPDATE profile SET like_count = '$likeCount' + 1 WHERE email = '$email'";

$conn->prepare($sql)->execute([$likeCount]);

$previous = "javascript:history.go(-1)";
if(isset($_SERVER['HTTP_REFERER'])) {
    $previous = $_SERVER['HTTP_REFERER'];
}


?>
