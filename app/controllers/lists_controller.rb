class ListsController < ApplicationController

	def new
		@list = List.new
	end

	def create
		list = List.new
		list.restaurant_id = params["restaurant_id"]
		list.user_id = session[:user_id]
		list.save
		redirect_to root_url
	end

	def show
		# @lists = List.connection.select_all("SELECT * FROM lists WHERE user_id = #{session[:user_id]}")
	end
end