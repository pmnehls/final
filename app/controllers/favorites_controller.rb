class FavoritesController < ApplicationController

  def new
    @lists = List.where(:user_id => session[:user_id])
    @prev_first = Favorite.where(:user_id => session[:user_id], :number => 1)
    @prev_second = Favorite.where(:user_id => session[:user_id], :number => 2)
    @prev_third = Favorite.where(:user_id => session[:user_id], :number => 1)
  end

  def create

    Favorite.where(:user_id => session[:user_id]).delete_all

    fav1 = Favorite.new
    fav1.user_id = session[:user_id]
    fav1.restaurant_id = params["first"]
    fav1.number = 1

    fav2 = Favorite.new
    fav2.user_id = session[:user_id]
    fav2.restaurant_id = params["second"]
    fav2.number = 2

    fav3 = Favorite.new    
    fav3.user_id = session[:user_id]
    fav3.restaurant_id = params["third"]
    fav3.number = 3

    if (fav1.save && fav2.save && fav3.save)
      flash[:notice] = "Your favorites have been set."
    else
      flash[:error] = "You did not select valid favorites."
    end
    redirect_to "/lists/#{session[:user_id]}"
  end

  def edit

  end

  def destroy

  end

end