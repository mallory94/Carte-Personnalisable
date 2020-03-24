<?php 
	function recupIdBD($pseudo){
		require ("./modele/connect.php");
		$sql = 'select idUtilisateur from utilisateur where pseudo=?;';
        try {
            
            $commande = $pdo->prepare($sql);
            $commande->execute(array($pseudo));
			return $commande->fetch(PDO::FETCH_ASSOC);
			
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
        }
	}
	
    function inscrireBD($infos){
        require ("./modele/connect.php");
        $sql = 'INSERT INTO utilisateur (pseudo, email, mdp) VALUES ( ? , ? , ? )';
        try {
            
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute(array($infos['pseudo'], $infos['email'] , $infos['mdp']));
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
        }
        return ;
    }

    function setBConnectBD($pseudo, $boolean){
        require ("./modele/connect.php");
        $sql = "UPDATE utilisateur SET bConnect =:val
        WHERE pseudo=:utilisateurPseudo";
    
        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':val', $boolean);
            $commande->bindParam(':utilisateurPseudo', $pseudo);
            $bool = $commande->execute();	
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
        }
    }

    function recupMdpBD($pseudo) {
        require ("./modele/connect.php");
        $sql = "SELECT mdp FROM utilisateur WHERE pseudo=?";
        $resultat = array();
        try{
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute(array($pseudo));
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC);
                if ($resultat == false) {
                    return("");
                }
                else {
                    return($resultat['mdp']);
                }
            }
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
    }



    function pseudoDejaPrisBD($pseudo){
        require ("./modele/connect.php");

        $sql = "SELECT pseudo FROM utilisateur WHERE pseudo=?";
        $resultat = array();
        try{
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute(array($pseudo));
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC);
                if ($resultat == false) {
                    return(false);
                }
                else {
                    return(true);
                }
            }
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
    }

    

    function emailDejaUtiliseBD($email){
        require ("./modele/connect.php");

        $sql = "SELECT email FROM utilisateur WHERE email=?";
        $resultat = array();
        try{
            $commande = $pdo->prepare($sql);
            
            $bool = $commande->execute(array($email));
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC);
                if ($resultat == false) {
                    return(false);
                }
                else {
                    return(true);
                }
            }
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
    }

    function pseudoInexistantBD($pseudo){
        require ("./modele/connect.php");
        $sql = "SELECT pseudo FROM utilisateur WHERE pseudo=?";
        $resultat = array();
        try{
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute(array($pseudo));
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC);
                if ($resultat == false) {
                    return(true);
                }
                else {
                    return(false);
                }
            }
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
    }
    
	function RecupCartesPersosBD($pseudo){
		require ("./modele/connect.php");
		$sql = "select idCarte, LabelCarte from carte as c inner join utilisateur as u on c.idUtilisateur = u.idUtilisateur where pseudo = ?";
		try{
            $commande = $pdo->prepare($sql);
            $commande->execute(array($pseudo));
			return $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
	}
	
	function RecupCartesPartageesBD($pseudo){
		require ("./modele/connect.php");
		$sql = "select p.idCarte, LabelCarte 
				from carte as c, partage as p, utilisateur as u
				where c.idCarte = p.idCarte and p.idRecepteur = u.idUtilisateur and u.pseudo = ?;";
		try{
            $commande = $pdo->prepare($sql);
            $commande->execute(array($pseudo));
			return $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
	}
	
	function ajouterCarteBD($pseudo, $NomCarte){
		require ("./modele/connect.php");
		try{
			$idUtilisateur = recupIdBD($pseudo);
			$enregCarte = $pdo->prepare('INSERT INTO carte(idCarte, LabelCarte, idUtilisateur) VALUES (0, :LabelCarte, :idUtilisateur)');
			$enregCarte->bindParam(':LabelCarte', $NomCarteAjout);
			$enregCarte->bindParam(':idUtilisateur', $id);

			$NomCarteAjout = $NomCarte;
			$id = $idUtilisateur['idUtilisateur'];
			$enregCarte->execute();
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
	}
	
	function PartagerCarteBD($pseudo, $pseudoDestinataire, $idCarte){
		require ("./modele/connect.php");
		//var_dump( $pseudoDestinataire);
		try{
			if ($pseudo == $pseudoDestinataire){
				echo "Vous ne pouvez pas partager de carte avec vous-même";
				return;
			}
			$idUtilisateur = recupIdBD($pseudo);
			$idDestinataire = recupIdBD($pseudoDestinataire);
			//var_dump($idUtilisateur);
			//echo $idCarte;
			//var_dump($idDestinataire);
			$verifCarte = $pdo->prepare('select * from carte where idCarte=? and idUtilisateur=?');
			
			$verifCarte->execute(array($idCarte, $idDestinataire['idUtilisateur']));
			$resultat = $verifCarte->fetchAll(PDO::FETCH_ASSOC);
			if (!empty($resultat)){
				echo "l'utilisateur possède déjà cette carte" ;
				return;
			}
			
			$enregCarte = $pdo->prepare('INSERT INTO partage(idPartage, idCarte, idEmetteur, idRecepteur) VALUES (0, :idCarte, :idEmetteur, :idRecepteur)');
			$enregCarte->bindParam(':idCarte', $idCartePartage);
			$enregCarte->bindParam(':idEmetteur', $idEmetteur);
			$enregCarte->bindParam(':idRecepteur', $idRecepteur);

			$idCartePartage = $idCarte;
			$idEmetteur = $idUtilisateur['idUtilisateur'];
			$idRecepteur = $idDestinataire['idUtilisateur'];
			$enregCarte->execute();
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
	}
	
	function selectAttributsCarteBD($idCarte){
		require ("./modele/connect.php");
		try{
			$Marqueurs = $pdo->prepare("select LattitudeMarqueur, LongitudeMarqueur, iconUrl from marqueurs where idCarte=?");
			$Marqueurs->execute(array($idCarte));
			$res = $Marqueurs->fetchAll(PDO::FETCH_ASSOC);
			return $res;
		}
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); 
        }
	}
    
    function supprimerMarkeursSelonIdCarteBD($idCarte){
        require ("./modele/connect.php");
        $sql = 'DELETE FROM marqueurs WHERE idCarte=?';
        try {
            
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute(array($idCarte));
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
        }
        return ;
    }
    
    function nouveauMarqueurBD($LattitudeMarqueur, $LongitudeMarqueur, $iconUrl ,$idCarte){
        require ("./modele/connect.php");
        $sql = 'INSERT INTO marqueurs (LattitudeMarqueur, LongitudeMarqueur, iconUrl, idCarte ) VALUES ( ? , ? , ? , ?)';
        try {
            
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute(array($LattitudeMarqueur, $LongitudeMarqueur, $iconUrl, $idCarte));
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
        }
        return ;
    }
?>