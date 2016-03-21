class ProyectosController < ApplicationController
	
	def show
		@proyecto = Proyecto.find(params[:id])
	end

  def new
    @user = current_user
  	@proyecto = Proyecto.new
  end

  def create
  	@proyecto = Proyecto.new(proyecto_params)
  	if @proyecto.save
  		flash[:success] = "Proyecto creado!"
  		redirect_to @proyecto
  	else
  		render 'new'
  	end
  end

  private  

  	def proyecto_params
  		params.require(:proyecto).permit(:nombre, :descripcion, :coordenadas)
  	end

end
