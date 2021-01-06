class UsersController < ApplicationController
  
		before_action :set_user, only: %i[create]
    


    def show
      @user = User.find(params[:id])
      return render json: @user.houses, status: :ok if @user
    end

    def new_favorite
      @user = User.find_by(id: favorite_params[:user_id])
      @house = House.find_by(id: favorite_params[:house_id])
      favorite = Favorite.create!(favorite_params)
      render json: favorite, status: :created
    end

    private

    def set_user
      @user = User.find_by(email: params[:email])
    end

  
    def favorite_params
      params.permit(:house_id, :user_id)
    end
  end