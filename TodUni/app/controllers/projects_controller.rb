class ProjectsController < ApplicationController

  def index
    @user = current_user
    @tag_counts = Project.tag_counts
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

	def show
    @user = current_user
		@project = Project.find(params[:id])
		@members = @project.users
	end

  def new
    @user = current_user
    redirect_to dashboard_path(@user), :flash => {notice: "Necesitas completar tu informacion"} unless @user.complete?
  	@project = Project.new
  end

  def create
    @user = current_user
  	@project = Project.new(project_params)
    
  	if @project.save
			@user.own_project @project
  		redirect_to @project
		else
			render :new
  	end
  end

  def update_picture
    #FIX: When click the button without selecting an image
    #     it fails
    @project = Project.find(params[:id])
    if @project.update_attributes(picture_params)
      redirect_to :back, :flash => {notice: "Foto actualizada"}
    else
      redirect_to :back, :flash => {notice: "No se pudo actualizar tu foto"}
    end
  end

	def add_members
		email = params[:email]
		project = current_user.projects.find(params[:id])
		@members = project.users
		if User.exists?(email: email)
			project.users << User.where(email: email)	
      redirect_to :back
    else	
		  redirect_to :back, :flash => {alert: "Ese usuario no existe"}
    end
	end

  private  

  	def project_params
  		params.require(:project).permit(:name, :description) 
  	end

    def picture_params
      params.fetch(:project, {}).permit(:picture)
    end

    def emails
      params.require(:project).permit(:users)
    end
end
