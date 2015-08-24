class UsersController < ApplicationController
	def index
		user = User.find_by(id: session[:user_id])
		if !user.admin
			redirect_to root_url
		end
		@users = User.all
	end

	def show
		if params[:id].to_i != session[:user_id]
			flash[:error] = "You don't have access to that page."
      redirect_to root_url
    else
      @user = User.find(params[:id])
    end
		# @user = User.find(session[:user_id])
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
			session[:user_id] = @user.id
			flash[:notice] = "Welcome #{@user.username}!"
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

	def follow
		f = Follow.new
		f.followed_id = params["followed_id"]
		f.follower_id = session[:user_id]
		u = User.find(params["followed_id"])
		if (f.save)
			flash[:notice] = "You are now following #{u.username}!"
		else
			flash[:error] = "You were already following #{u.username}"
		end
		redirect_to root_url
	end
end