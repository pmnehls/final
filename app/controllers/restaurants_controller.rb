class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find_by(:id => params["id"])
	end 

	def update
		restaurant = Restaurant.find_by(:id => params["id"])
		restaurant.name = params["name"]
		restaurant.category_id = params["category_id"]
		restaurant.neighborhood_id = params["neighborhood_id"]
		restaurant.address = params["address"]
		restaurant.price = params["price"]
		restaurant.rating = params["rating"]
		restaurant.image_url = params["image_url"]
		restaurant.save

		redirect_to root_url
	end

	def edit
		@restaurant = Restaurant.find_by(:id => params["id"])
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new
		@restaurant.name = params["name"]
		@restaurant.category_id = params["category_id"]
		@restaurant.neighborhood_id = params["neighborhood_id"]
		@restaurant.address = params["address"]
		@restaurant.price = params["price"]
		@restaurant.rating = params["rating"]
		@restaurant.image_url = params["image_url"]
		if @restaurant.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy
		@restaurant = Restaurant.find_by(:id => params["id"])
		@restaurant.delete
		redirect_to "/restaurants"
	end

end