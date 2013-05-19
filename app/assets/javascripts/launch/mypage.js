function set_bar(size)
{
	$('#bar_count')[0].innerHTML = size;
	if(size <= 2)
		size = 25 + (size/2)*25;
	else if(size <= 5)
		size = 50 + ((size-2)/3)*25;
	else if(size <= 10)
		size = 50 + (size/5)*25;
	else
		size = 100;	
	$('.bar').animate({
		width: size+'%'
	}, 1000, function(){
		$('.bar b').fadeIn();
	});
}

function show_email_pane()
{
	$('#email_pane').slideDown();
	$('#content').animate({
		'height': '680px'
	});
}