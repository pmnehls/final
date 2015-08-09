class User < ActiveRecord::Base

	has_many :restaurants, :through => :lists

	validates :name, :email, :password, presence: true
	validates :password, confirmation: true
	
end