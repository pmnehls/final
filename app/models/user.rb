class User < ActiveRecord::Base

	has_secure_password

	has_many :lists
	has_many :restaurants, :through => :lists

	validates :username, :email, presence: true
	validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
	validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true
	validates :password, confirmation: true

	# to avoid duplicate accounts with the same email or username
	validates_uniqueness_of :email, :case_sensitive => false
	validates_uniqueness_of :username, :case_sensitive => false
	
end