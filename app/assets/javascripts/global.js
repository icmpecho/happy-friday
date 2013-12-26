$(document).ready(function (){

	$('#topic_btn').on('click', function(){
		$('#topic_form').removeClass('hidden');
		$('#topic').addClass('hidden');
	});
	$('#topic_form button').on('click', function(){
		$('#topic_form').addClass('hidden');
		$('#topic').removeClass('hidden');
	});

	// fade out when alert box trigger
	$(".alert").fadeOut(2000);

});