class RegistrationsController < ApplicationController
 skip_before_action :require_login, only: [:create]

  def index
    @users = User.all
    render json: @users

  end

  def create
     @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: {
        email: @user.email
      }, token: token }
    else
      render json: { error: @user.errors.full_messages }
    end
  end

  # def show

  #   @user = User.find(params[:id])
  #   render json: @user
  #   @user_meetups = @user.meetups

  # end

  def update
    @user = User.find(params[:id])
    render json: @user
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end