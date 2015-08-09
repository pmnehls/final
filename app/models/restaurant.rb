class Restaurant < ActiveRecord::Base

	belongs_to :neighborhood
	belongs_to :category
	has_many :users, :through => :lists
	# has_many :lists, :through => :users

	validates_presence_of :name

end