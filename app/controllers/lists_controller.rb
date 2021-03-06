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
		else
			flash[:error] ="#{r.name} was already on your wall."
		end
		redirect_to "/lists/#{session[:user_id]}"
	end

	def show
		@lists = List.where(:user_id => params["id"]).all
		@user = User.find(params["id"])
	end

	def recommend

	end

	def destroy
		@list = List.find_by(:id => params["id"])
		@list.delete
		redirect_to "/lists/#{session[:user_id]}"
	end
end