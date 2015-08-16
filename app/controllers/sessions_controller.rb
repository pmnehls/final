class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by_email(params["email"])

		if !user
			user = User.find_by_username(params["email"])
		end 

		if user
			if user.authenticate(params["password"])
				session[:user_id] = user.id
				flash[:notice] = "Welcome #{user.username}!"
				redirect_to root_url
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	def destroy
		reset_session
		redirect_to root_url
	end

end
