class Restaurant < ActiveRecord::Base

	belongs_to :neighborhood
	belongs_to :category

end