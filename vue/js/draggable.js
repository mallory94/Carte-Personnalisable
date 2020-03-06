$( function() {
    $( "#draggable" ).draggable();
  } );


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
                     $draggable.animate({ top: 0, left: 0 }, 'slow');
                     return false;
                 } else {
                     // just let the build in work, although really, you could animate to 0,0 here as well
                     return true;
                 }
             }
        }
    });

    $("#mapid").droppable({
        activeClass: 'ui-state-hover',
        hoverClass: 'ui-state-active',
        drop: function(event, ui) {
            alert("droppable s'active");
            creerMarker();
        }
    });


    function creerMarker() {

        var greenIcon = L.icon({
            iconUrl: 'https://leafletjs.com/examples/custom-icons/leaf-green.png',
            shadowUrl: 'leaf-shadow.png',
        
            iconSize:     [38, 95], // size of the icon
            shadowSize:   [50, 64], // size of the shadow
            iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 62],  // the same for the shadow
            popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
        });

        // L.control.mousePosition().addTo(map);
        L.marker([48.855599, 2.349101], { draggable : true , icon: greenIcon}).addTo(mymap);

    

    // L.marker([50.505, 30.57], {icon: myIcon}).addTo(map);
    // marker.on('dragend', function (e) {
    // document.getElementById('latitude').value = marker.getLatLng().lat;
    // document.getElementById('longitude').value = marker.getLatLng().lng;
    
    }

    // $("#mapid").click(function(){
    // var mousePosition = L.geoportalControl.MousePosition({
    //     position : 'bottomright',
    //     collapsed : true
    // });
    // Console.log(mousePosition.position);
    // });


    // function onClick($)


    
        

    //     // var marker = L.marker([mousePoistion., 5.470247],{
    //     // draggable: true
    //     // }).addTo(map);
        
});