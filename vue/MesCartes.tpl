<!DOCTYPE html>
<html>

<head>
<title>Mes Cartes</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<div id="Header">
		<h1>Bienvenue dans votre espace personnel</h1>
	</div>
	<div id="CartesPersos">
		<h1>Mes Cartes personnelles</h1>
		<?php 
			foreach($ListCartesPersos as $var){?>
				<div draggable="true" ondragstart="drag(event, this.value)" id=<?php echo $var['idCarte'] ?>><?php echo $var['LabelCarte'] ?></div>
			<?php
			}
		?>
		<input type=button value="ajouter une carte" id="ajouterCarte" onclick="afficherformAjout()">
		<form style="display:none;" action="index.php?controleur=utilisateur&action=ajouterCarte&Nom=NomCarte" method="post" id="formAjout">
			<input type="text" placeholder="entrez le nom de la carte">
			<input type="submit" value="soumettre">
		</form>
	</div>
	<div id="CartesPartagees">
		<h1>Cartes Partagées avec moi</h1>
		<?php 
			foreach($ListCartesPartagees as $var){?>
				<div draggable="true" ondragstart="drag(event, this.value)" id=<?php echo $var['idCarte'] ?>><?php echo $var['LabelCarte'] ?></div>
			<?php
			}
		?>
	</div>
	<div id="Partage">
		<h1>Partager une carte</h1>
		<div id="droppable" style="width : 150px;
									height: 150px;
									border-width:1px;
									 border-style:dotted;
									 border-color:black;" ondrop="drop(event)" ondragover="allowDrop(event)">
			<p>Glissez une carte de votre choix pour la partager</p>
		</div>
		<form action="index.php?controleur=utilisateur&action=PartagerCarte" method="post" id="formPartage">
			<input type="hidden" id="CarteChoisie" name="idCartePartage">
			<input type="text" name="pseudoDest" placeholder="entrez le pseudo du destinataire">
			<input type="button" value="valider" onclick="ExisteCarteDrag(this)">
			<input id="Envoyer" style="display:none" type="submit" value="soumettre">
		</form>
	</div>
</body>
</html>


<script>
	function afficherformAjout(){
		document.getElementById("formAjout").style.display = "block";
	}
	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev, value) {
		if(document.getElementById("CarteChoisie").value != ""){
			alert("veuillez choisir une seule carte");
			return;
		}
		ev.dataTransfer.setData("idCarte", ev.target.id);
		//console.log(ev.target.id);
		//ev.dataTransfer.setData("idCarte", value);
	}

	function drop(ev) {
		ev.preventDefault();
		var data1 = ev.dataTransfer.getData("idCarte");
		console.log(data1);
		//var data2 = ev.dataTransfer.getData("idCarte");
		ev.target.appendChild(document.getElementById(data1));
		document.getElementById("CarteChoisie").value += data1;
		//console.log(document.getElementById("CarteChoisie").value);
	}
	
	function ExisteCarteDrag(button){
		//console.log(document.getElementById("CarteChoisie").value + "r");
		if (document.getElementById("CarteChoisie").value == ""){
			alert("veuillez saisir une carte");
		}
		else{
			button.disabled = true;
			document.getElementById("Envoyer").style.display = "block";
		}
	}
</script>