<?php
  require_once("settings.php");
  session_start();

  $conn = @mysqli_connect($host, $user, $pwd, $sql_db);
  if (!$conn) {
  echo "<p>Database connection failure</p>";
  }
  mysqli_set_charset($conn, "utf8");
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST["query"]){
      $queryValue = $_POST["query"];
    }
    if ($queryValue){
      $starttime = microtime(true);
      try {
        $result = mysqli_query($conn, $queryValue);
        if ($result !== false) {
            echo "Query executed successfully!";
            //PRINT MESSAGE WHEN SUCCESSFUL
        } else {
            echo "Error executing the query: " . mysqli_error($conn);
        }
      } catch (Exception $e) {
          echo mysqli_error($conn);
          //PRINT MESSAGE WHEN ERROR
      }
      $endtime = microtime(true);
      $duration = $endtime - $starttime;
    }
    if(isset($result)){
      $num_rows = mysqli_num_rows($result);
    }
    //Print the query time.
    if(isset($duration)){
      echo "<span> Time Executed: ". round($duration, 2, PHP_ROUND_HALF_UP) . "</span>";
    }

    //Print the number of rows.
    if(isset($num_rows)){
      echo "<span> Number of row: "  . $num_rows . "</span>";
    }
  }
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      font-size: 1em;
    }

    th,
    td {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 2px;
    }

    th {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #f5f5f5;
    }

    th,
    td {
      transition: background-color 0.3s ease;
    }
  </style>

  <Header>

    <div>
      <h1>AgileMaster69 query page</h1>
    </div>
    <h1 style="text-align: center;">SQL Interactive Demonstrator</h1>
    <h4 style="text-align: center;">by Ho Thanh An, Dang Nam Khanh, Le Xuan Nhat, Duong
      Quang Thanh</h4>
  </Header>
  <div>
    
    <section>

      <h2>MySQL:</h2>
      <!-- <form action="http://mercury.swin.edu.au/it000000/cos10005/regtest.php" method="POST" > -->
      <form action="index.php" method="POST">
        <div style="display: flex;">
          <input type="text" class="query_box" name="query" placeholder="Enter your SQL query here">
          <div aria-label="Orange and tan hamster running in a metal wheel" role="img" class="wheel-and-hamster" style="margin-left: 20px;">
            <div class="wheel"></div>
            <div class="hamster">
              <div class="hamster__body">
                <div class="hamster__head">
                  <div class="hamster__ear"></div>
                  <div class="hamster__eye"></div>
                  <div class="hamster__nose"></div>
                </div>
                <div class="hamster__limb hamster__limb--fr"></div>
                <div class="hamster__limb hamster__limb--fl"></div>
                <div class="hamster__limb hamster__limb--br"></div>
                <div class="hamster__limb hamster__limb--bl"></div>
                <div class="hamster__tail"></div>
              </div>
            </div>
            <div class="spoke"></div>
          </div>
        </div>
 
        <button type="submit">Go</button>

      </form>
      


    </section>
    <?php
      if (isset($result)) {
        $fields = $result->fetch_fields();
    
        echo "<table border='1'><tr>";
        
        foreach ($fields as $field) {
            echo "<th>" . ucfirst($field->name) . "</th>";
        }
    
        echo "</tr>";
    
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            foreach ($row as $value) {
                echo "<td>" . $value . "</td>";

            }
            echo "</tr>";
        }
    
        echo "</table>";
    } else {
      if (isset($sql)){
        echo "Error: " . $sql . "<br>" . $conn->error;
      }
    }
    ?>
  </div>
</body>

</html>