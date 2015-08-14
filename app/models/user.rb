class User < ActiveRecord::Base

	has_secure_password

	has_many :restaurants, :through => :lists

	validates :name, :email, :password, presence: true
	validates :password, confirmation: true

	# to avoid duplicate accounts with the same email as that is the login info
	validates_uniqueness_of :email, :case_sensitive => false
	validates_uniqueness_of :username, :case_sensitive => false
	
end