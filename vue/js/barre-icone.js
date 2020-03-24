$(document).ready(function() {
    var menu = $(".menu");
    var arrow = $(".arrow");
    


    $(".toggle").on('click', function() {
      $.each([menu, arrow], function() {
          this.toggleClass('out');
      });
      $.each([$(".download"), $(".save"), $(".trash"), $(".undo"), $(".room"),
       $(".add-box")], function() {
          this.toggleClass('hide-icons');
      });
      $(this).addClass('anim').delay(800).queue(function(next) {
         $(this).removeClass('anim');
          next()
         });
    });


    
  });

  