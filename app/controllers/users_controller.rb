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
		@user.username = params[:username]
		@user.email = params[:email]
		@user.image_url = "https://acrobatusers.com/assets/images/template/author_generic.jpg"
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
		@user = User.find(session[:user_id])
		@user.username = params[:username]
		@user.email = params[:email]
		@user.image_url = params[:image_url]
		if @user.save
			flash[:notice] = "Account Updated!"
			redirect_to list_url(@user.id)
		else
			render 'edit'
		end
	end

	def destroy

	end
end