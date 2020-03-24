$('.openmodale').click(function (e) {
    console.log("la fonction s'execute");
    e.preventDefault();
    $('.modale').addClass('opened');
});
$('.closemodale').click(function (e) {
    e.preventDefault();
    $('.modale').removeClass('opened');
});