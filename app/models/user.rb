class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :houses, through: :favorites, source: 'house'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
