class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		if params[:id].to_i != session[:user_id]
			redirect_to root_url, notice: "You can only look at your own account."
		else
			@user = User.find(params[:id])
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.username = params[:username]
		@user.email = params[:email]
		@user.password = params[:password]
		@user.password_confirmation = params[:password_confirmation]

		if @user.save
			flash[:notice] = "Sign Up Successful!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params["id"])
	end

	def update
		@user.username = params[:username]
		@user.email = params[:password]
		@user.password = params[:password]
		if @user.save
			flash[:notice] = "Account Updated!"
			redirect_to user_url(@user.id)
		else
			render 'edit'
		end
	end

	def destroy

	end
end