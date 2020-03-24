<!doctype html>
<html class="no-js" lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <!-- bootstrap import -->
  <link href='  https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./vue/css/rebootBootstrap.css" media="all">
  <!-- fin bootstrap import -->
  <link rel="stylesheet" href="./vue/css/carousel.css" media="all">
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
  integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
  crossorigin=""/>
  
  <link rel="stylesheet" href="./vue/css/map.css" media="all">
  <link rel="stylesheet" href="./vue/css/accueil.css" media="all">
  <link rel="stylesheet" href="./vue/css/carousel.css" media="all">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css" media="all">
  
   <!-- pour la barre d'icone -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="./vue/css/barre-icone.css" media="all">
   <!-- fin barre icone -->
   <link rel="stylesheet" href="./vue/css/menu.css" media="all">
  <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
  <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
  integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
  crossorigin="">
</script>



  
  <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="./plugins/leaflet-osm/leaflet-osm/leaflet-osm.js"></script>
  <!-- plugin pour faire des redirections  -->
  <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
  <!--  -->
</head>



<body id="body">
<header>
  <nav class="clearfix">
    <ul class="clearfix">
      <li><a href="index.php">Accueil</a></li>
      <li><a href="#">Démo</a></li>
      <li><a href="#">A propos</a></li>
      <li><a href="#">Contact</a></li>
      <li><a href="index.php?controleur=utilisateur&action=MesCartes">Mes cartes</a></li>
      <?php if (isset($_SESSION['bConnect'])){
              if ($_SESSION['bConnect']) {
                echo('<li><a href="index.php?controleur=utilisateur&action=accueilApresDeconnexion">Déconnexion</a></li>');
              }
            }
            else { 
              echo(
                    '<li><a href="index.php?controleur=utilisateur&action=redirectionInscription">Inscription</a></li>
                    <li><a href="index.php?controleur=utilisateur&action=redirectionConnexion">Connexion</a></li>'
                  );
            }
  ?>
  </ul>
  <a href="#" id="pull">Menu</a>
</nav>
<div id="msgBienvenue">BIENVENUE</div>

<p class="intro">Vous souhaitez personnaliser votre propre carte intéractive ?</p> 
<p class="intro">Vous êtes au bon endroit</p> 

<input type="text" id="LieuDepart" placeholder="Saisissez votre lieu de départ"/>
<input type="text" id="LieuArrivée" placeholder="Saisissez votre lieu d'arrivée"/>
<button id="calculIt">Calculer l'itinéraire</button>





</header>  
<div id="myposition"></div><br><br>
<br>
<br>
<br>

/* barre définisasnt la taille de l'icone */

<div class="slidecontainer">
  <input type="range" min="1" max="100" value="50" class="slider" id="myRange">
</div>


<div id="draggable" class="ui-widget-content">
  <p>Drag me around</p>
</div>
<img src="https://img.icons8.com/clouds/100/000000/cloud-network.png"/>


<div class="container">
  <div class="screen">
    <ul class="toolbar">
        <li id="toggle" class="toggle">
          <i class="material-icons arrow out">arrow_back</i>
          <i class="material-icons menu">menu</i>
        </li>
        <li class="primary-icons">
          <i class="material-icons add-box">add</i>
          <i class="material-icons room">room</i>
          <i class="material-icons undo">undo</i>
      </li>
      <li class="secondary-icons">

        <i class="material-icons download hide-icons">file_download</i>
        <i class="material-icons trash hide-icons">delete</i>
      </li>
    </ul>
  </div>
</div>

<!--  -->


<div id="mapid" class="ui-widget-header droppable"></div>
<button id="test" onClick="retirerDerniermarker()">Revenir en arrière</button>

<input type="button" id="btnSauvegarderCarte" value="Sauvegarder la carte">
<button onclick="console.log(idMap)">Click me</button>



</body>
<script src="./vue/js/menu.js"></script>
<script src="./vue/js/alertes.js"></script>
<script src="./vue/js/draggable.js"></script>
<script src="./vue/js/carousel.js"></script>
<script src="./vue/js/barre-icone.js"></script>
<script src="./vue/js/carte.js"></script>

<?php
if (isset($options['provenance'])) {
  switch ($options['provenance']) {
    case "inscription";
      echo('<script language="javascript">apresInscription();</script>');
      break;

    case "connexion";
      echo('<script language="javascript">apresConnexion();</script>');
      break;

    case "deconnexion";
      echo('<script language="javascript">apresDeconnexion();</script>');
      break;
  }
  
}
?>
<!--  -->
<input type=hidden id=variableIdMap value=<?php 
   if ( isset($_SESSION['idMap'])) {
      echo($_SESSION['idMap']);
   }
   ?>
>

<input type=hidden id=tableauMarkersJsonString value=<?php echo (json_encode($ListMarqueurs))?>>

</html>
