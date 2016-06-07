class Admin < ActiveRecord::Base
	self.table_name = "harcerze"
	validates :pesel, presence: true, length: {is: 11, message: "should happen once per year"}, uniqueness: true
	validates :imie, :nazwisko, :wiek, :zastep, presence: true
end
