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

	def edit
		@comentario = Comentario.find(params[:id])
	end

	def create
		@comentario = Comentario.new(comParams)
		if @comentario.save
			flash[:success] = "Comentario añadido."
			redirect_to @comentario
		else
			render 'new'
		end
	end

	def update
		@comentario = Comentario.find(params[:id])
		@comentario.destroy
		redirect_to comentarios_path
	end

	private
		def comParams
			params.require(:comentario).pemrit(:coment)
		end
end
