jQuery(document).ready(function($) {
	// Auto-handle direct jpeg links
	$('a[href$="jpg"]').each(function() {
		$(this).lightbox();
	});
	$('a[href$="png"]').each(function() {
		$(this).lightbox();
	});
});
