class ComentariosController < ApplicationController
	def index
		@comentarios = Comentario.all
	end

	def show
		@comentario = Comentario.find(params[:id])
	end

	def new
		@comentario = Comentario.new
	end

	def create
		@comentario = Comentario.new(com_params)
		if @comentario.save
			redirect_to comentarios_path, :notice => "Coolllll"
		else
			render 'new'
		end
	end

	def edit
		@comentario = Comentario.find(params[:id])
	end

	def update
		@comentario = Comentario.find(params[:id])
		if @comentario.update_attributes(com_params)
			redirect_to comentarios_path
		else
			render "edit"
		end		
	end

	def destroy
		@comentario = Comentario.find(params[:id])
		@comentario.destroy
		redirect_to peliculas_path
	end



	private
		def com_params
			params.require(:comentario).permit(:coment)
		end
end
