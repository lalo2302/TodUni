$(document).ready(function() {
	$('.save_btn').hide();
	$('.reply_box').hide();
	$('.cancel_btn').hide();

	$('.reply_btn').click(function(){
		$(this).siblings('.reply_box').show();	
		$(this).siblings('.save_btn').show();	
		$(this).siblings('.cancel_btn').show();	
		$(this).hide();
	});
	$('.cancel_btn').click(function(){
		$(this).siblings('.reply_box').hide();
		$(this).siblings('.save_btn').hide();	
		$(this).hide();
		$(this).siblings('.reply_btn').show();
	});
});
