<?php

    function inscrire($infos) {
        require_once ("./modele/utilisateurBD.php");
        inscrireBD($infos);
    }
    
    function connecte($pseudo){
        require_once ("./modele/utilisateurBD.php");
        $_SESSION['pseudo'] = $_POST['pseudo'];
        setBConnectBD($pseudo, true);
        $_SESSION['bConnect'] = true;
    }

    function deconnecte($pseudo){
        require_once ("./modele/utilisateurBD.php");
        $_SESSION['bConnect'] = false;
        $_SESSION= array();
        setBConnectBD($pseudo, false);
    }


    /* FONCTIONS DE VERIFICATION */

    /* vérifie que les informations entrées lors de la connexion sont coérentes avec la base de données */
    function verifConnexion(){
        $_POST['options'] = array();

        if (pseudoInexistant($_POST['pseudo'])){
            $_POST['options']['pseudoInexistant'] = true;
        }
        if (mdpIncorrect($_POST['pseudo'],$_POST['mdp'])){
            $_POST['options']['mdpIncorrect'] = true;
        }
        if (count($_POST['options']) == 0){
            connecte($_POST['pseudo']);
            accueilApresConnexion();
        }
        else {
            var_dump("vous n'êtes pas connecté");
        }
    }

    /* vérifie que les informations entrées lors de l'inscription sont coérentes entre elles mais aussi avec la base de données */
    function verifInscription(){
        //$options est un tableau qui spécifie les erreurs lors d'une inscription.
        $_POST['options'] = array();
        if (mdpDifferents()) {
            $_POST['options']['mdpDifferents'] = true;
        }
        if (pseudoDejaPris()) {
            $_POST['options']['pseudoDejaPris'] = true;
        }
        if (emailDejaUtilise()) {
            $_POST['options']['emailDejaUtilise'] = true;
        }
        if (count($_POST['options']) == 0) {
            $infos = $_POST;
            $infos['mdp'] = password_hash($infos['mdp'],PASSWORD_DEFAULT);
            inscrire($infos);
            connecte($_POST['pseudo']);
            accueilApresInscription();
        }
        else {
            redirectionInscription();
        }
    }

    function mdpDifferents(){
        return ($_POST['mdp'] != $_POST['mdp_bis']);
    }

    function pseudoDejaPris(){
        require_once ("./modele/utilisateurBD.php");
        return pseudoDejaPrisBD($_POST['pseudo']);
    }

    function emailDejaUtilise(){
        require_once ("./modele/utilisateurBD.php");
        return (emailDejaUtiliseBD($_POST['email']));
    }
    
    function mdpIncorrect($pseudo,$mdpSaisi){
        require_once ("./modele/utilisateurBD.php");
        return (!password_verify($mdpSaisi,recupMdpBD($pseudo)));
    }
    
    function pseudoInexistant($pseudo){
        require_once ("./modele/utilisateurBD.php");
        return pseudoInexistantBD($pseudo);
    }

    /* FIN DES FONCTIONS DE VERIFICATION */










    /* FONCTIONS DE REDIRECTION */

    function accueil(){
        require ("./vue/accueil.tpl");
        
    }

    function accueilApresInscription(){
        $options['provenance'] = "inscription";
        header("Location:index.php");
        accueil();
    }

    function accueilApresDeconnexion(){
        if (count($_SESSION) != 0){
            deconnecte($_SESSION['pseudo']);
            $options['provenance'] = "deconnexion";
        }
        header("Location:index.php");
        accueil();
    }

    function accueilApresConnexion(){
        $options['provenance'] = "connexion";
        header("Location:index.php");
        accueil();
    }

    /* redirige vers la page inscription */
    function redirectionInscription(){
        require ("./vue/inscription.tpl");
    }

    /* redirige vers la page connexion */
    function redirectionConnexion(){
        require ("./vue/connexion.tpl");
    }

    /* FIN DES FONCTIONS DE REDIRECTION */
	
	function MesCartes(){
		require_once ("./modele/utilisateurBD.php");
		$pseudo = $_SESSION['pseudo'];
		$ListCartesPersos = RecupCartesPersosBD($pseudo);
		$ListCartesPartagees = RecupCartesPartageesBD($pseudo);
		require("./vue/MesCartes.tpl");
	}
	function ajouterCarte(){
		require_once ("./modele/utilisateurBD.php");
		$pseudo = $_SESSION['pseudo'];
		$NomCarte = $_GET['Nom'];
		ajouterCarteBD($pseudo, $NomCarte);
		$ListCartesPersos = RecupCartesPersosBD($pseudo);
		$ListCartesPartagees = RecupCartesPartageesBD($pseudo);
		require("./vue/MesCartes.tpl");
		
	}
	
	function PartagerCarte(){
		require_once ("./modele/utilisateurBD.php");
		$pseudo = $_SESSION['pseudo'];
		$idCarte = $_POST['idCartePartage'];
		//echo $idCarte;
		$pseudoDestinataire = $_POST['pseudoDest'];
		PartagerCarteBD($pseudo, $pseudoDestinataire, $idCarte);
		$ListCartesPersos = RecupCartesPersosBD($pseudo);
		$ListCartesPartagees = RecupCartesPartageesBD($pseudo);
		require("./vue/MesCartes.tpl");
	}
	
	function SauvegarderCarte(){
        $jsonStringify = $_POST['jsonStringify'];
        $datas = json_decode($jsonStringify);
        var_dump($datas);
        $idMap = $_POST['idMap'];
        supprimerMarkeursSelonIdCarteBD($idMap);
        foreach ($datas as $markeur) {
            nouveauMarqueurBD($markeur['latlng']['lat'], $markeur['latlng']['lng'], $markeur['iconUrl'], $idMap);
        }
	}
?>