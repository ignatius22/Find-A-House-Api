class StaticController < ApplicationController
  def home
    render json: { "status": 'it works' }
  end
end
