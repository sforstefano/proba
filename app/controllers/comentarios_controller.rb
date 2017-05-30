class ComentariosController < ApplicationController
	def index
		@comentario = Comentarios.all
	end

	def new
		@comentario = Comentarios.new
	end

	def create
		@comentario = Comentarios.new(comParams)
		if @comentario.save
			flash[:success] = "Comentario añadido."
			redirect_to pelicula_path(@comentarios)
		else
			render 'new'
		end
	end

	private
		def comParams
			params.require(:comentarios).pemrit(:coment)
		end
end
