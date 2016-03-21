class ProjectsController < ApplicationController
	
	def show
    @user = current_user
		@project = Project.find(params[:id])
	end

  def new
    @user = current_user
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		flash[:success] = "Proyecto creado!"
  		redirect_to @project
  	else
  		render 'new'
  	end
  end

  private  

  	def project_params
  		params.require(:project).permit(:name, :description, :coordinates)
  	end

end
