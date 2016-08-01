class CommentsController < ApplicationController
	before_action :find_parent

	def new
		@comment = Comment.new
	end

	def create
		@comment = @parent.comments.new comment_params

		if @comment.save
			redirect_to :back, notice: "Comment successfully posted"
		else
			redirect_to :back, notice: "Comment error"
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end

	def find_parent
		@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		@parent = Project.find_by_id(params[:project_id]) if params[:project_id]
	end

end
