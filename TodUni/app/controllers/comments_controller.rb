class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		commentable = commentable_type.constantize.find(commentable_id)
		@comment = Comment.build_from(commentable, current_user.id, body)

		respond_to do |format|
			if @comment.save
				make_child_comment
				format.html { redirect_to :back, notice => 'Comment successfully posted' }
			else
				format.html { render :action => "new" }
			end
		end
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.edited_at = DateTime.now
		@comment.body = body
		if @comment.save
			flash.now[:success] = "Comment successfully updated"
		else
			flash.now[:error] = "Your comment could not be updated"
		end
		redirect_to :back
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
	end

	def commentable_type
		comment_params[:commentable_type]
	end

	def commentable_id
		comment_params[:commentable_id]
	end
	
	def comment_id
		comment_params[:comment_id]
	end

	def body
		comment_params[:body]
	end

	def make_child_comment
		return "" if comment_id.blank?

		parent_comment = Comment.find(comment_id)
		@comment.move_to_child_of(parent_comment)
	end

end
