jQuery(document).ready(function($) {
       $('a[href$=".jpg"], a[href$=".gif"]').each(function() {
          $(this).attr('rel','lightbox'); 
       });
});
