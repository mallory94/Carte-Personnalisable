var mymap = L.map('mapid').setView([48.8534, 2.3488], 12);


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


/*L.marker([48.841788, 2.268595]).addTo(mymap)
    .bindPopup('IUT Paris Descartes')
    .openPopup();
*/

