class StaticController < ApplicationController
  def home
    render json: { "message": 'welcome to the API' }
  end
end
