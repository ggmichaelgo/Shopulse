function bg_roll()
{
	var bg = $($(".wallpaper")[1]);
	bg.fadeIn(2000, function(){
		setTimeout(function() {
			$($(".wallpaper")[1]).fadeOut(2000);
		}, 5000);		
	});
}


$(document).ready(function(){
	setInterval(bg_roll, 5000);
	$('#return').bind('mouseenter', function() {
		$("#return_message").fadeIn();
	}).bind('mouseleave', function() {
		$("#return_message").fadeOut();
	});

	$('#privacy_dialog').dialog({
		modal: true,
		title: false,
		width: 480,
		height: 265
	});
	$('#privacy_dialog').dialog('close');
	$(".ui-dialog-titlebar").hide();
	// $('#privacy_dialog').dialog("close");
});
