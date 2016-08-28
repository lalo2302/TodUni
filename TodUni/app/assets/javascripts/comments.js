// TODO: transcribe to coffee
$(document).ready(function() {
	$('.new_form').hide();
	$('.edit_form').hide();

	$('.reply_btn').click(function(){
		$(this).siblings('.edit_form').hide();
		$(this).siblings('.new_form').show();
	});

	$('.edit_btn').click(function(){
		$(this).siblings('.new_form').hide();
		$(this).siblings('.edit_form').show();
	});

	$('.cancel_btn').click(function(){
		$('.new_form').hide();
		$('.edit_form').hide();
	});
});
