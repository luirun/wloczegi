class User < ActiveRecord::Base
	has_secure_password
	EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
	validates :login, :presence => true, :uniqueness => true, :length => { :in => 3..20 }, on: :create
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX, on: :create
	validates :password, :presence => true, :confirmation => true, length: { :in => 6..50,
	    too_short: "The password must have at least %{count} characters.",
		too_long: "The password must have no more than %{count} characters.",
		}, on: :create
	validates :password_confirmation, :presence => true, :confirmation => true, length: { :in => 6..50,
	    too_short: "The password must have at least %{count} characters.",
		too_long: "The password must have no more than %{count} characters.",
		}, on: :create
	validates_presence_of :imie, :nazwisko, :password, on: :create
	
	def combined_value
		"#{self.imie} #{self.nazwisko}"
	end
	
end