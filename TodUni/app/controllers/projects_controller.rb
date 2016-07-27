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
    @members = @project.members
    @owner = @project.owner
	end

  def new
    @user = current_user
    redirect_to dashboard_path(@user), :flash => {notice: "Necesitas completar tu información"} unless @user.complete?
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
    #TODO: Refactor
    @project = Project.find(params[:id])
    picture = params[:project][:picture] if params[:project].present?
    if !picture.blank? and picture.size < 5.megabytes and @project.update_attributes(picture_params)
      redirect_to :back, :flash => {notice: "Foto actualizada"}
    else
      redirect_to :back, :flash => {notice: "Lo siento, vuélvelo a intentar o sube otra imagen"}
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

  def add_tags
    @project = Project.find(params[:id])
    tags = params[:project][:tag_list] if params[:project].present?
    if tags.present?
      @project.tag_list.add(tags)
      @project.save
      redirect_to :back
    else
      redirect_to :back, :flash => {alert: "Algo salio mal"}
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
