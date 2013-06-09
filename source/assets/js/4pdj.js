//= require lightbox
//= require bootstrap

jQuery(document).ready(function($) {
	$('a[href$=".jpg"], a[href$=".gif"]').each(function() {
          $(this).attr('rel','lightbox'); 
	});
	$("img").each(function() {
    	  var img = $(this);
    	  if (!img.attr("alt") || img.attr("alt") == "") {
            img.attr("alt", "No alt specified.");
    	  }
        });
});
