var mymap = L.map('mapid').setView([48.8534, 2.3488], 12);

var idMap;
var markersCharges;
var idCartePartage;

$( function() {

  //récupération de l'id de la carte en utilisant une variable stockée dans une div invisible
  idMap = document.getElementById("variableIdMap").value;
  idCartePartage = document.getElementById("cartePartageUt").value;
  console.log(idCartePartage);
  
  if(document.getElementById("tableauMarkersJsonString").value !== "") {
    // génération des markers
    markersCharges = JSON.parse(document.getElementById("tableauMarkersJsonString").value);
    console.log(markersCharges);

    for (var indiceMarker = 0; indiceMarker < markersCharges.length; ++indiceMarker) {
      marker = markersCharges[indiceMarker];
      creerMarker(marker.LattitudeMarqueur, 
        marker.LongitudeMarqueur ,
        marker.iconUrl);
    }
    // fin génération des markers
  }
 
  





  var xlng = 0.000256;
  var xlat = 0.000200;


  mymap.on('click', function(e) {
      console.log(e.latlng.lat,e.latlng.lng);
      L.polygon([
        [e.latlng.lat-xlat,e.latlng.lng-xlng],
        [e.latlng.lat+xlat,e.latlng.lng-xlng],
        [e.latlng.lat-xlat,e.latlng.lng+xlng],
        [e.latlng.lat+xlat,e.latlng.lng+xlng],
      ]).addTo(mymap);
      
        L.polyline([
        [e.latlng.lat,e.latlng.lng-xlng],
        [e.latlng.lat,e.latlng.lng+xlng]
      ]).addTo(mymap);
    });
});


window.onload = function(){

    

    new L.OSM.Mapnik().addTo(mymap);
    // new L.OSM.CycleMap({apikey: '7c460f8f625a4bdbbfc9620246420c0b'}).addTo(mymap);
    // new L.OSM.TransportMap({apikey: '7c460f8f625a4bdbbfc9620246420c0b'}).addTo(mymap);

    $.ajax({
         url: "http://www.openstreetmap.org/api/0.6/node/164979149",
        // or "http://www.openstreetmap.org/api/0.6/way/52477381/full",
        dataType: "xml",
        success: function (xml) {
          var layer = new L.OSM.DataLayer(xml).addTo(mymap);
          mymap.fitBounds(layer.getBounds());
        }
      });

    //CODE TRANSPORT DE CLEMENT
	// var couche = new
	// L.TileLayer('https://tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=7c460f8f625a4bdbbfc9620246420c0b');
	// mymap.addLayer(couche);
	// $("calculIt").click(function(){
    //         calculItineraire();
    //     })

    /*test sur la souris*/
    // var mousePosition = L.geoportalControl.MousePosition({
    //     displayCoordinate : true,
    //     altitude : {
    //             triggerDelay : 500
    //     } 
    // });
    // mymap.addControl(mousePosition);

    // var mousePosition = new ol.control.MousePosition({
    //     coordinateFormat: ol.coordinate.createStringXY(2),
    //     projection: 'EPSG:4326',
    //     target: document.getElementById('myposition'),
    //     undefinedHTML: '&nbsp;'
    // });
    

    //   mymap.addControl(mousePosition);
}

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: 'pk.eyJ1Ijoic2FsdXRhbXlhbWlnbyIsImEiOiJjazZxa3hhMXcwYWFyM25xbGJvOXhtYnp3In0.3CfXpHCip_7Qj8BPrG5FVQ'
    }).addTo(mymap);
	
	
	function goAdress() {
		  var searchCtrl = L.geoportalControl.SearchEngine({});
		  mymap.addControl(searchCtrl);
		}

		Gp.Services.getConfig({
		  apiKey: "jhyvi0fgmnuxvfv0zjzorvdn",
		  onSuccess: goAdress
	});
	
	function goItinéraire() {
    var routeCtrl = L.geoportalControl.Route({
    });
	mymap.addControl(routeCtrl);

}

	Gp.Services.getConfig({
		apiKey : "jhyvi0fgmnuxvfv0zjzorvdn",
		onSuccess : goItinéraire
	}) ;






  jQuery(function($){
    $("#btnSauvegarderCarte").click(function() {
      console.log("active la fonction");
      console.log(listeMarkers);
      var markersJSON = []
      for ( var i = 0; i < listeMarkers.length; ++i) {
        markersJSON.push(
          {
            latlng: listeMarkers[i]['_latlng'],
            iconUrl: listeMarkers[i]['_icon']['src']
          }
        )
      }

      var jsonStringify = JSON.stringify(markersJSON);
      $.redirect("http://localhost/Projet-PWEBC/index.php?controleur=utilisateur&action=SauvegarderCarte", 
          { 
            idMap: idMap,
            jsonStringify: jsonStringify
          }
          , "POST");
      }
    );
  });
