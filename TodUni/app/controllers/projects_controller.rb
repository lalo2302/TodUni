class ProjectsController < ApplicationController

  def index
    @user = current_user
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

	def show
    @user = current_user
		@project = Project.find(params[:id])
	end

  def new
    @user = current_user
  	@project = Project.new
  end

  def create
    @user = current_user
  	@project = Project.new(project_params)
    @user.projects << @project
    assign_usernames(@project)
    
  	if @project.save
  		flash[:success] = "Proyecto creado!"
  		redirect_to @project
  	else
  		render 'new'
  	end
  end

  private  

  	def project_params
  		params.require(:project).permit(:name, :description, :coordinates, :picture, :tag_list)
  	end

    def usernames
      params.require(:project).permit(:users)
    end

    def assign_usernames (project)
      debugger
      users = usernames.values.first.split(',')
      usernames.values.each do |usr|
        if User.exists?(username: usr)
          project.users << User.where(username: usr)
        end
      end
    end
end
