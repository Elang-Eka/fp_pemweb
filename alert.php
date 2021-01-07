<?php 
if (empty($_GET['alert'])) {
}

elseif ($_GET['alert']==1) {
	echo
	'<div class="alert alert-danger">
	Username dan Password Salah !
	</div>';
}
elseif ($_GET['alert']==2) {
	echo
	'<div class="alert alert-danger">
	Login Terlebih Dahulu !
	</div>';
}
elseif ($_GET['alert']==3) {
	echo
	'<div class="alert alert-secondary">
	Logout Berhasil !
	</div>';
}
?>