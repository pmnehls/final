class RestaurantsController < ApplicationController
	def index
		if params["keyword"].present?
			k = params["keyword"].strip
			@restaurants = Restaurant.where("name LIKE ?", "%#{k}%").limit(10000).page(params[:page]).per(20)
		else
			@restaurants = Restaurant.limit(10000).page(params[:page]).per(20)
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
		restaurant = Restaurant.new
		restaurant.name = params["name"]
		restaurant.category_id = params["category_id"]
		restaurant.neighborhood_id = params["neighborhood_id"]
		restaurant.address = params["address"]
		restaurant.rating = params["rating"]

		# editing string to link to a higher res photo from yelp
		# original API response is 100x100
		img = params["image_url"].chomp('ms.jpg') << "l.jpg"
		restaurant.image_url = img

		if restaurant.save
			flash[:notice] = "#{restaurant.name} added to FoodEase"

			# this parameter diferentiates the button to both add to foodease
			# and to add to your wall
			if params[:list_user_id]
				list = List.new
				list.restaurant_id = restaurant.id
				list.user_id = session[:user_id]

				if list.save
					flash[:notice] = "#{restaurant.name} added to your wall."
				else
					flash[:error] ="#{restaurant.id} was already on your wall."
				end
			end
		else
			flash[:error] = "#{restaurant.name} is already on Foodease"
		end



		redirect_to root_url

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