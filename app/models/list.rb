class List < ActiveRecord::Base

	#List represents a restaurant that is added to a user's
	#list of favorite restaurants
	belongs_to :user, dependent: :destroy
	belongs_to :restaurant, dependent: :destroy

	# to prevent a user from adding a restaurant to a list more than once
	validates_uniqueness_of :restaurant_id, scope: :user_id
	
end
