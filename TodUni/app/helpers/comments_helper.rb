module CommentsHelper
	def get_comments_count(parent)
		count = 0
		for comment in parent.comments
			if comment.comments_count != nil
				count += get_comments_count(comment) + 1
			else
				count += 1
			end
		end
		count
	end
end
