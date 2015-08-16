class Restaurant < ActiveRecord::Base

	belongs_to :neighborhood
	belongs_to :category
	has_many :lists
	has_many :users, :through => :lists

	validates_presence_of :name

	# in order to avoid duplicate listings of manually added restaurants
	# name is checked for uniqueness within the scope of a neighborhood
	# allowing for restaurants with multiple locations.
	validates_uniqueness_of :name, scope: :neighborhood, :case_sensitive => false

end