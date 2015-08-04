class Restaurant < ActiveRecord::Base

	belongs_to :neighborhood
	belongs_to :category

	validates_presence_of :name

end