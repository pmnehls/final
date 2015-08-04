class Restaurant < ActiveRecord::Base

	belongs_to :neighborhood
	belongs_to :category
	has_many :users, :through => :lists

	validates_presence_of :name

end