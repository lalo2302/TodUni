$ ->
	$('.comment-reply').click ->
		$(this).closest('.comment').find('.comment-body').show()
		$(this).closest('.comment').find('.edit-form').hide()
		$(this).closest('.comment').find('.reply-form').show()
		return
		
	$('.comment-edit').click ->
		$(this).closest('.comment').find('.comment-body').hide()
		$(this).closest('.comment').find('.edit-form').show()
		$(this).closest('.comment').find('.reply-form').hide()
		return

	$('.comment-cancel').click ->
		$(this).closest('.comment').find('.comment-body').show()
		$(this).closest('.comment').find('.edit-form').hide()
		$(this).closest('.comment').find('.reply-form').hide()
		return
	
