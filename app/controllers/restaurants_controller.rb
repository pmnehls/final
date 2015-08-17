class RestaurantsController < ApplicationController
	def index
		if params["keyword"].present?
			k = params["keyword"].strip
			@restaurants = Restaurant.where("name LIKE ?", "%#{k}%")
		else
			@restaurants = Restaurant.limit(500)
		end
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

		# editing string to link to a higher res photo from yelp
		# original API response is 100x100

		img = params["image_url"].chomp('ms.jpg') << "o.jpg"
		@restaurant.image_url = img

		if @restaurant.save
			flash[:notice] = "#{@restaurant.name} added to FoodEase"
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

	def search
    	parameters = { term: params[:term], limit: 10, category_filter: 'restaurants' }
    	@response = Yelp.client.search('Chicago', parameters)
  	end

end