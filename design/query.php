<?php
  require_once("settings.php");
  session_start();
  $conn = @mysqli_connect($host, $user, $pwd, $sql_db);
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Check if the form was submitted using POST

      // Retrieve the value from the form input named "query"
      $queryValue = $_POST["query"];

      // Now you can use $queryValue in your PHP code
      echo "You entered: " . $queryValue;
  } else {
      // Handle the case when the form is not submitted via POST
      echo "Form not submitted";
  }
//   $sql = "INSERT INTO course (
//   name,
//   type,	
//   introduction,	
//   length,	
//   outline,	
//   provider_id,	
//   benefit,	
//   price	)
//   VALUES ('DNK1', 'Beauty & Spa', 'techcomp', 4, 'Lol', 3, 'no benefit', 1000 )";
  $result = mysqli_query($conn, $queryValue);
  $row = mysqli_fetch_array($result);

  $_SESSION['result'] = $row;
  $_SESSION['test'] = "hello world";
  if (!$result) {
    echo "<p>Failed</p>";
  } else {
    header('location: ./index.php');
  }
?>