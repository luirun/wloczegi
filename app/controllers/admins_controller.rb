class AdminsController < ApplicationController

  def panel
   @all = Admin.all
  end
 
  def new
		@user = Admin.new
 end
 
	def create
	@user = Admin.new(secure_params)
		if @user.valid?
		@user.save
		flash[:notice] = "Cos tutaj dziala!"
		redirect_to admins_panel_path
		else
		flash[:notice] = "Cos tutaj nie dziala!"
		redirect_to admins_new_path
	end
	end
  
end

private

	def secure_params
		params.require(:admin).permit(:id, :imie, :nazwisko, :pesel, :zastep, :wiek)
	end