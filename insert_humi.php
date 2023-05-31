<?php

if(isset($_GET["humi"])) {
   $humi = $_GET["humi"]; // get humi value from HTTP GET

   $servername = "localhost";
   $username = "root";
   $password = "";
   $database_name = "cornfield";

   // Create MySQL connection fom PHP to MySQL server
   $connection = new mysqli($servername, $username, $password, $database_name);
   // Check connection
   if ($connection->connect_error) {
      die("MySQL connection failed: " . $connection->connect_error);
   }

   $sql = "INSERT INTO tbl_humi (humi_value) VALUES ($humi)";

   if ($connection->query($sql) === TRUE) {
      echo "New record created successfully";
   } else {
      echo "Error: " . $sql . " => " . $connection->error;
   }

   $connection->close();
} else {
   echo "temperature is not set in the HTTP request";
}
?>
