$(document).ready(function() {
    var menu = $(".menu");
    var arrow = $(".arrow");
    var room = $(".room");
    var add = $(".add");
    var search = $(".search");
    var download = $(".download");
    var trash = $(".trash");


    $(".toggle").on('click', function() {
      $.each([menu, arrow], function() {
          this.toggleClass('out');
      });
      $.each([add, search, download, trash, room], function() {
          this.toggleClass('hide-icons');
      });
      $(this).addClass('anim').delay(800).queue(function(next) {
         $(this).removeClass('anim');
          next()
         });
     });
  });
