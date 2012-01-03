ShowTooltip = function(e)
{
     $("#toolTipId").show();
	var text = $(this).next('.yellowspeechbubble');
	if (text.attr('class') != 'yellowspeechbubble')
		return false;

	text.fadeIn()
		.css('top', 290)
		.css('left',190);

	return false;
}
HideTooltip = function(e)
{
	var text = $(this).next('.yellowspeechbubble');
	if (text.attr('class') != 'yellowspeechbubble')
		return false;
	text.fadeOut();
}

SetupTooltips = function()
{
	$('.show-tooltip')
		.each(function(){
			$(this)
				.after($('<span/>')
					.attr('class', 'yellowspeechbubble')
					.html($(this).attr('title')))
				.attr('title', '');
		})
		.hover(ShowTooltip, HideTooltip);
}

$(document).ready(function() {
	SetupTooltips();
});