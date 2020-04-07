<!doctype html>
<html class="no-js" lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <!-- bootstrap import -->
  <link href='  https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

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
  <link rel="stylesheet" href="./vue/css/GpPluginLeaflet.css" media="all">
  <link rel="stylesheet" href="./vue/css/GpPluginLeaflet-map.css" media="all">
  <link rel="stylesheet" href="./vue/css/GpPluginLeaflet-src.css" media="all">
  <link rel="stylesheet" href="./vue/css/zoneRecherche.css" media="all">

  
   <!-- pour la barre d'icone -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="./vue/css/barre-icone.css" media="all">
   <!-- fin barre icone -->
   <link rel="stylesheet" href="./vue/css/menu.css" media="all">
   <link rel="stylesheet" href="./vue/css/palette.css" media="all">
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
  <img id="logo" src="./vue/icones/logo.svg"/>
    <ul class="clearfix">
    
      <li></li>
      <li><a href="index.php">Accueil</a></li>
      <?php if(isset($_SESSION['bConnect'])) {
         echo('<li><a href="index.php?controleur=utilisateur&action=MesCartes">Mes cartes</a></li>');
         }
         ?>
      
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
      <li><a href="#">A propos</a></li>
      <li><a href="#">Contact</a></li>
  </ul>
  <a href="#" id="pull">Menu</a>
</nav>

<?php if (!isset($_SESSION['pseudo'])) {
   echo('
   <div id="msgBienvenue">BIENVENUE</div>
   <p class="intro">Vous souhaitez personnaliser votre propre carte intéractive ?<br>Vous êtes au bon endroit.<br><br><br>Inscrivez-vous si vous n\'avez pas encore de compte.<br>(la connexion sera automatique)<br><br>Une fois connecté(e) , vous pourrez éditer votre carte.</p>');
   }
   else if (isset($_SESSION['idMap'])) {
      echo('
      <p class="intro">Vous pouvez maintenant <a class="souligne" href="#barre-icone">éditer votre carte</a><br>Faites glisser des images sur la carte pour créer des marqueurs ou séléctionnez une icone parmi celles disponibles</p><br>
      <p class="intro"><br><br>- importer des icones/images/gif depuis internet -<br><br></p>
      <div class="tutoGif"><img  src="https://i.imgur.com/dKl1I9K.gif"/>
         </div><br><br><br>
         <p class="intro"><br><br>- choisir les icônes qui apparaissent dans la barre d\'outils -<br><br></p>
      <div class="tutoGif"><img  src="https://i.imgur.com/K2saPnF.gif"/>
         </div><br><br><br>
         <p class="intro"><br><br>- Supprimer le dernier marqueur placé -<br><br></p>
      <div class="tutoGif"><img  src="https://i.imgur.com/Q4cfyEw.gif"/></div>
         <br><br>
         <br><p class="intro">- Rechercher une adresse -<br>(Attention, le marqueur généré après la recherche ne sera pas sauvegardé)<br></p>
         <div class="tutoGif"><blockquote class="imgur-embed-pub" lang="en" data-id="u6vcKR4"><a href="//imgur.com/u6vcKR4">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script></div
         <br><br>
         <p class="intro"><br><br>- Déterminer un itinéraire -<br><br></p>
         <br><br>
         <div class="tutoGif"><img  src="https://i.imgur.com/HV7WcKG.png"/>
         </div>
         <br><br><br><br>
         ');
   }
   else {
      echo('
      <div id="msgBienvenue">OH OH...</div>
      <p class="intro">Vous n\'avez pas sélectionné de carte.<br><br><br>Rendez vous sur la page <a class="souligne" href="index.php?controleur=utilisateur&action=MesCartes">Mes cartes</a> pour créer ou sélectionner une carte<br><br></p>');
   }
   ?>





</header>  




<!-- Modal -->

<div class="modale" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-header">
      <h2>Sélectionnez une icone qui sera temporairement stockée dans votre barre</h2>
      <a href="#" class="btn-close closemodale" aria-hidden="true">&times;</a>
    </div>
    <div class="modal-body">
    <img class="icon" src="https://img.icons8.com/clouds/100/000000/cloud-network.png"/>
    <img class="icon" src="https://img.icons8.com/officel/64/000000/online-store.png"/>
    <img class="icon" src="https://img.icons8.com/color/64/000000/home.png"/>
    <img class="icon" src="https://img.icons8.com/color/64/000000/road.png"/>
    <img class="icon" src="https://img.icons8.com/color/64/000000/gps-searching.png"/>
    <img class="icon" src="https://img.icons8.com/color/64/000000/user-location.png"/>
    <img class="icon" src="https://img.icons8.com/color/64/000000/map-pin.png"/>
    <img class="icon" src="https://img.icons8.com/color/64/000000/map-pokemon.png"/>
    <img class="icon" src="https://i.imgur.com/Y5IbOU4.png"/>
    <div class="modal-footer">
      <a href="#" id="btnValiderChoix" class="btn" id="btn_ingresar">valider le choix</a>
    </div>
  </div>
</div>

<!-- /Modal -->





<div id="barre-icone" class="container">
  <div class="screen">
    <ul class="toolbar">
        <li id="toggle" class="toggle">
          <i class="material-icons arrow out">arrow_back</i>
          <i class="btn btn-big">icones</i>
          
          
        </li>
        <?php if ( isset($_SESSION['idMap'])) {
         echo('<i id="btnSauvegarder" class="btn btn-big">sauvegarder la carte</i>');
        }
        ?>
        <li class="primary-icons">
        <img src="https://img.icons8.com/color/64/000000/home.png"/>
          <i class="material-icons undo" title="supprimer le dernier marqueur placé" >undo</i>
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




</body>
<script src="./vue/js/GpPluginLeaflet.js"></script>
<script src="./vue/js/GpPluginLeaflet-map.js"></script>
<script src="./vue/js/GpPluginLeaflet-src.js"></script>
<script src="./vue/js/menu.js"></script>
<script src="./vue/js/alertes.js"></script>
<script src="./vue/js/draggable.js"></script>
<script src="./vue/js/carousel.js"></script>
<script src="./vue/js/barre-icone.js"></script>
<script src="./vue/js/carte.js"></script>
<script src="./vue/js/paletteIcone.js"></script>


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
<input type=hidden id=tableauMarkersJsonString value=
<?php if (isset($ListMarqueurs)) {
   echo(json_encode($ListMarqueurs));

}?>>


<input type="hidden" id="cartePartageUt" value=
<?php if (isset($_SESSION['pasDraggable'])){ 
   echo $_SESSION['pasDraggable'];
}
?>>
</html>
