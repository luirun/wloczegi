class UsersController < ApplicationController
	
	def new
		@users = User.new
	end
	
	def create
		@users = User.new(secure_params)
			if @users.valid?
				@users.save
				flash[:notice] = "Zarejestrowano użytkownika #{@users.login}"
				redirect_to sessions_new_path
			else
				flash[:notice] = "Wystapil blad #{@users.login}"
				render 'new'
			end
	end
	
	def profile
		@user = User.where(:login => params[:login]).first
	end
	
private

	def secure_params
		params.require(:user).permit(:login, :email, :password, :password_confirmation, :password_digest, :imie, :nazwisko)
	end
	
end