<?php
//Connexion à la base de donnée 

	$hostname = "localhost";
	$base="PwebcBDD";
	$loginBD= "root";
	$passBD="";
	// $passBD="";
	$pdo = null;

try {
	$pdo = new PDO ("mysql:server=$hostname; dbname=$base", "$loginBD", "$passBD");
}

catch (PDOException $e) {
	die  ("Echec de connexion : " . $e->getMessage() . "\n" . $e->getTrace() . "\n" );
}

?>
