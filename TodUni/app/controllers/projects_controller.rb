class ProjectsController < ApplicationController

  def index
    @user = current_user
    @projects = Project.all
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
  	@project = @user.projects.build(project_params)
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
  		params.require(:project).permit(:name, :description, :coordinates, :picture)
  	end

    def usernames
      params.require(:project).permit(:users)
    end

    def assign_usernames (project)
      usernames.values.each do |usr|
        if User.exists?(username: usr)
          project.users << User.where(username: usr)
        end
      end
    end
end
