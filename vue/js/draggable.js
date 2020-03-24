var listeMarkers = [];
var positionMarker;
var nb = 0;

 


$( function() {
    $( "#draggable" ).draggable();
});


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
                draggable: true}));
            listeMarkers[listeMarkers.length-1].addTo(mymap);
        }

    

    

    document.getElementById("btnSauvegarderCarte")

    
});



function retirerDerniermarker(){
    if (listeMarkers.length > 0) {
        mymap.removeLayer(listeMarkers.pop());
    }
}



function creerMarker(lat, lng, iconUrl) {
    var latlng = L.latLng(lat, lng);
    listeMarkers.push(L.marker(latlng, {icon: L.icon({iconUrl: iconUrl, iconSize: [64, 64],
        iconAnchor: [16,32]}),
        draggable: true}));
    listeMarkers[listeMarkers.length-1].addTo(mymap);
    console.log("créer un marker");
}