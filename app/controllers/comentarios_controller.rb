class ComentariosController < ApplicationController
	def index
		@comentario = Comementario.all
	end

	def new
		@comentario = Comentario.new
	end

	def create
		@comentario = Comentario.new(comParams)
		if @comentario.save
			flash[:success] = "Comentario añadido."
			redirect_to pelicula_path(@comentarios)
		else
			render 'new'
		end
	end

	private
		def comParams
			params.require(:comentario).pemrit(:coment)
		end
end
