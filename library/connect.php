<?php

//connect to the FAVESTREAM DB

//Setup variables for connection
$hostname="localhost";
$username="root@localhost";
$password="R@cecar910";
$dbname="favestream.";

//Connect to the DB
$connection = mysql_connect($hostname, $username, $password, $dbname);
mysql_select_db($dbname, $connection);


?>