<?php
require_once "database.php";

$username = $_POST['username'];
$password = $_POST['password'];

$query = mysqli_query($mysqli, "SELECT * FROM petugas WHERE USERNAME='$username' AND PASSWORD='$password'")
or die('Ada kesalahan pada query user: '.mysqli_error($mysqli));
$rows  = mysqli_num_rows($query);

if ($rows > 0) {
	$data  = mysqli_fetch_assoc($query);
	session_start();

	if($data['ID_LEVEL']=="1"){

		$_SESSION['id'] = $data['ID_PETUGAS'];
		$_SESSION['username'] = $data['USERNAME'];
		$_SESSION['password'] = $data['PASSWORD'];
		$_SESSION['nama_petugas'] = $data['NAMA_PETUGAS'];
		$_SESSION['id_level'] = $data['ID_LEVEL'];
		header("location:../index.php?page=admin");
	}

	else if($data['ID_LEVEL']=="2"){
		$_SESSION['id'] = $data['ID_PETUGAS'];
		$_SESSION['username'] = $data['USERNAME'];
		$_SESSION['password'] = $data['PASSWORD'];
		$_SESSION['nama_petugas'] = $data['NAMA_PETUGAS'];
		$_SESSION['id_level'] = $data['ID_LEVEL'];
		header("location:../index.php?page=operator");
	}
}

else {
	header("Location: ../login.php?alert=1");
}

?>