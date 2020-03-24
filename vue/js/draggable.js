var listeMarkers = [];
var positionMarker;
var nb = 0;

 





$(function() {

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

var var_retirerDerniermarker = function retirerDerniermarker(){
    if (listeMarkers.length > 0) {
        mymap.removeLayer(listeMarkers.pop());
    }
}

$(".undo").on('click', var_retirerDerniermarker);



function creerMarker(lat, lng, iconUrl) {
    var latlng = L.latLng(lat, lng);
    listeMarkers.push(L.marker(latlng, {icon: L.icon({iconUrl: iconUrl, iconSize: [64, 64],
        iconAnchor: [16,32]}),
        draggable: true}));
    listeMarkers[listeMarkers.length-1].addTo(mymap);
    console.log("créer un marker");
}