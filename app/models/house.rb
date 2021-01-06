class House < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :favorites
  has_many :users, through: :favorites
  has_one_attached :image
  validates :name, :description, :image_url, presence: true

  # def img_url
  #   url_for(image)
  # end
end