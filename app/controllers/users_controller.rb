class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(session[:user_id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.name = params[:name]
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
		@user = User.find_by(params[:id])
	end

	def update
		@user.name = params[:name]
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