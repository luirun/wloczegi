class Calendar < ActiveRecord::Base

has_many :id_harcerza
accepts_nested_attributes_for :id_harcerza

	def date
	@today = Time.new
	end
	
end
