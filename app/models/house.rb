class House < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :favorites

  validates :name, :description, :image_url, presence: true

  # def img_url
  #   url_for(image)
  # end
end