//= require bootstrap

$(function () {
    $("#navbar").affix({
        offset: { 
            top: function () {
                if ($('.logo').css('display') == 'block') {
                   return (this.top = $('.logo').height())
                } else {
		    return (this.top = 0)
                }
            } 
        }
    });
});
