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
  <link rel="stylesheet" href="./vue/css/menu.css" media="all">
  <link rel="stylesheet" href="./vue/css/map.css" media="all">
  <link rel="stylesheet" href="./vue/css/accueil.css" media="all">
  <link rel="stylesheet" href="./vue/css/carousel.css" media="all">
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
</head>



<body id="body">
<header>
  <nav class="clearfix">
    <ul class="clearfix">
      <li><a href="index.php?controleur=utilisateur&action=accueil">Accueil</a></li>
      <li><a href="#">Démo</a></li>
      <li><a href="#">A propos</a></li>
      <li><a href="#">Contact</a></li>
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
<div id="draggable" class="ui-widget-content">
  <p>Drag me around</p>
</div>

<div id="mapid" class="ui-widget-header droppable"></div>
<button id="test" onClick="retirerDerniermarker()">Revenir en arrière</button>



<div class="container">

   
 
<!--  <a href="https://github.com/rtpHarry/Bootstrap3-ShowManySlideOneCarousel">this code sample</a>   -->
<div class="row">
 <div class="col-md-12">
    <div class="carousel carousel-showmanymoveone slide" id="carousel-tilenav" data-interval="false">
       <div class="carousel-inner">
          <div class="item active">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/0054A6/fff/&amp;text=1" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/002d5a/fff/&amp;text=2" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/d6d6d6/333&amp;text=3" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/002040/eeeeee&amp;text=4" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/0054A6/fff/&amp;text=5" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/002d5a/fff/&amp;text=6" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/eeeeee&amp;text=7" class="img-responsive"></a>
             </div>
          </div>
          <div class="item">
             <div class="col-xs-12 col-sm-6 col-md-2">
                <a href="#"><img src="http://placehold.it/500/40a1ff/002040&amp;text=8" class="img-responsive"></a>
             </div>
          </div>
       </div>
       <a class="left carousel-control" href="#carousel-tilenav" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
       <a class="right carousel-control" href="#carousel-tilenav" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
    </div>
 </div>
</div>

 
</div>

</body>





<script src="./vue/js/carte.js">
</script>
<script src="./vue/js/menu.js">
</script>
<script src="./vue/js/alertes.js">
</script>
<script src="./vue/js/draggable.js"></script>
<script src="./vue/js/carousel.js"></script>



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
</html>
