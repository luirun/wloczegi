class PostsController < ApplicationController

	def new
		@post = Post.new
		@kategoria = Category.select(:nazwa, :id)
	end
	
	def create
		@post = Post.new(secure_params)
			if @post.valid?
				@post.save
				flash[:notice] = "Post został dodany!"
				redirect_to root_path
			else
				flash[:error] = "Wystpil blad!"
				render 'new'
			end
	end
	
	def show
		@post = Post.where(:tytul => params[:s]).first
	end

	
private

	def secure_params
		params.require(:post).permit(:id, :tytul, :id_autora, :kategoria, :opis, :data_dodania)
	end
	
end