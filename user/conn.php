<?php 

function connection() {
   // membuat konekesi ke database system
   $dbServer = 'localhost';
   $dbUser = 'root';
   $dbPass = '';
   $dbName = "apotek";

   $conn = mysqli_connect($dbServer, $dbUser, $dbPass);

   if(! $conn) {
	die('Koneksi gagal: ' . mysqli_connect_error());
   }
   //memilih database yang akan dipakai
   mysqli_select_db($conn,$dbName);
	
   return $conn;
}