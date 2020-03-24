
$('.closemodale').click(function (e) {
    e.preventDefault();
    $('.modale').removeClass('opened');
});


$( function() {
    $('.icon').click(function (e) {
        console.log("la fonction s'execute");
        e.preventDefault();
        $(".modal-body").children().each(function() {
            $(this).removeClass("selectionne");
        })
        if ($(this).hasClass("selectionne")) {
            $(this).removeClass("selectionne");
        }
        else {
            $(this).addClass("selectionne");
        }
    })


    $('#btnValiderChoix').click(function (e) {
        console.log("la fonction s'execute");
        e.preventDefault();
        $('.primary-icons').prepend($(document.createElement('img')).attr('src', $(".selectionne").attr('src')))
        $(".selectionne")
        
        // $(this).addClass("selectionne");
    })

});