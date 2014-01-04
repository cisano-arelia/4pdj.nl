//= require bootstrap

$(function () {
    $("#navbar").affix({
        offset: { 
            top: function () {
                //console.log($('.logo').css('display'))
                //console.log($('.logo').is(':visible'))
                if ($('.logo').css('display') == 'block') {
                   return (this.top = $('.logo').height())
                } else {
		    return (this.top = 0)
                }
            } 
        }
    });
});
