class CommentsController < ApplicationController
	before_action :find_parent

	def new
		@comment = Comment.new
	end

	def create
		@user = current_user
		@comment = @parent.comments.new comment_params
		@comment.user = @user

		if @comment.save
			redirect_to :back, notice: "Comment successfully posted"
		else
			redirect_to :back, notice: "Comment error"
		end
	end

	def update #edit and delete
		@comment = Comment.find(params[:id])
		@comment.status = "edited"
		if @comment.update_attributes(comment_params)
			flash.now[:success] = "Comment updated"
		end
		redirect_to(:back)
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :status)
	end

	def find_parent
		@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		@parent = Project.find_by_id(params[:project_id]) if params[:project_id]
	end

end
