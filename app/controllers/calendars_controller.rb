class CalendarsController < ApplicationController

	def index
		new = Time.new
		@daysofmonth = Time.days_in_month(month=new.month, year=new.year)
		@today = new.day
		@spaces = (Date.today.at_beginning_of_month.wday )-1
		@events = Calendar.where('extract(month from event_date) = ?', new.month)
		@event = Calendar.find(1)
		@harcerz = Admin.select(:imie,:nazwisko).find(@event.idharcerza)
	end
	
	def new
		@events = Calendar.new
		@harcerze = Admin.select(:id, :imie, :nazwisko).group(:nazwisko)
	end
	
	def create
		@events = Calendar.new(secure_params)
		if @events.valid?
			@events.save
			flash[:notice] = "Wszystko sie dodalo!"
			redirect_to calendars_index_path
		else
			flash[:notice] = "Cos nie dzierga!"
			redirect_to calendars_new_path
		end
	end
	
	def describe
		@event = Calendar.find(params[:id])
		@harcerz = Admin.select(:imie,:nazwisko).find(@event.idharcerza)
	end
	
end

private

	def secure_params
		params.require(:calendar).permit(:id, :event_date, :godzina, :tytul, :opis, :idharcerza)
	end