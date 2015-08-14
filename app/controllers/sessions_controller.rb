class SessionsController < ApplicationController

	def new
		@session = Session.new
	end

	def create
		user = User.find_by_email(params["email"])

		if user
			if user.authenticate(params["password"])
				session[:user_id] = user.id
				flash[:notice] = "Welcome #{user.name}"
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
