var listeMarkers = [];
var positionMarker;
var nb = 0;

 


$( function() {
    $( "#draggable" ).draggable();
  } );
  var a = "troll";

  $(function() {
    $("#draggable").draggable({ 
        revert:  function(dropped) {
             var $draggable = $(this),
                 hasBeenDroppedBefore = $draggable.data('hasBeenDropped'),
                 wasJustDropped = dropped && dropped[0].id == "droppable";
             if(wasJustDropped) {
                 // don't revert, it's in the droppable
                 return false;
             } else {
                 if (hasBeenDroppedBefore) {
                     // don't rely on the built in revert, do it yourself
                     $draggable.animate({ top: 0, left: 0 }, 'fast');
                     return false;
                 } else {
                     // just let the build in work, although really, you could animate to 0,0 here as well
                     return true;
                 }
             }
        }
    });
    /***************************************/
    // var xlng = 0.000256;
    // var xlat = 0.000200;
    
    
    // mymap.on('mouseover', function(e) {
    //     console.log(e.latlng.lat,e.latlng.lng);
    //     console.log("e = " + e);
    //     positionMarker = e.latlng
    //     a = "change";
    //     console.log(positionMarker);
    //     console.log("nb dans la fct = " + ++nb);
    // });

    // $("#mapid").droppable({
    //     activeClass: 'ui-state-hover',
    //     hoverClass: 'ui-state-active',
    //     drop: function(event, ui) {
    //         //alert("droppable s'active");
            
    //         console.log("a = " + a);
    //         console.log(positionMarker);
    //         console.log("nb en dehors de la fct = " + nb);
    //         creerMarker(positionMarker);
    //     }
    // });
    divMap = document.getElementById("mapid");
    divMap.ondragover = function (e) {
            e.preventDefault()
        e.dataTransfer.dropEffect = "move"
        }
        
        divMap.ondrop = function (e) {
            e.preventDefault()
            imagePath = e.dataTransfer.getData("text/plain")
            coordinates = mymap.containerPointToLatLng(L.point([e.clientX,e.clientY]))
            listeMarkers.push(L.marker(coordinates, {icon: L.icon({iconUrl: imagePath, iconSize: [64, 64],
                iconAnchor: [16,32]}),
                draggable: true}))
            listeMarkers[listeMarkers.length-1].addTo(mymap)
        }

    function creerMarker(positionMarker) {
        var greenIcon = L.icon({
            iconUrl: './vue/icones/icones-money/001-money.svg',
            shadowUrl: 'leaf-shadow.png',
        
            iconSize:     [38, 95], // size of the icon
            shadowSize:   [50, 64], // size of the shadow
            iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 62],  // the same for the shadow
            popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
        });

        
        
        listeMarkers.push(L.marker([positionMarker.lat, positionMarker.lng], { draggable : true , icon: greenIcon}));

        listeMarkers[listeMarkers.length-1].addTo(mymap);
        console.log("créer un marker")

    // L.marker([50.505, 30.57], {icon: myIcon}).addTo(map);
    // marker.on('dragend', function (e) {
    // document.getElementById('latitude').value = marker.getLatLng().lat;
    // document.getElementById('longitude').value = marker.getLatLng().lng;

    }

    

    document.getElementById("btnSauvegarderCarte")

    
});




function retirerDerniermarker(){
    if (listeMarkers.length > 0) {
        mymap.removeLayer(listeMarkers.pop());
    }
}



