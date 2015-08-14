class ListsController < ApplicationController

	def new
		@list = List.new
	end

	def create
		list = List.new
		list.restaurant_id = params["restaurant_id"]
		list.user_id = session[:user_id]
		r = Restaurant.find(params["restaurant_id"])
		if (list.save)
			flash[:notice] = "#{r.name} added to your wall."
		end
		redirect_to root_url
	end

	def show

	end
end