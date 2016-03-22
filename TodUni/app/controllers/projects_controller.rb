class ProjectsController < ApplicationController
	
	def show
		@project = Project.find(params[:id])
	end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
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
  		params.require(:project).permit(:name, :description, :coordinates)
  	end

    def usernames
      params.require(:project).permit(:users)
    end

    def assign_usernames (project)
      debugger
      usernames.values.each do |usr|
        if User.exists?(username: usr)
          project.users << User.where(username: usr)
        #else
         # render 'new'
          #return false
        end
      end
    end
end
