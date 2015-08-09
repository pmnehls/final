class List < ActiveRecord::Base

	#List represents a restaurant that is added to a user's
	#list of favorite restaurants
	belongs_to :user
	belongs_to :restaurant
	
end
