class FavoritesController < ApplicationController
  before_action :current_user
  def index
    render json: current_user.houses
  end

  def create
    favorite = Favorite.new(user_id: current_user.id, house_id: params[:house_id])

    if favorite.save
      render json: "we added to your favourites"
    else
      render json: favorite.errors.full_messages
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])

    if favourite.destroy
      render json: "we deleted it from  your favourites"
    end
  end
end
