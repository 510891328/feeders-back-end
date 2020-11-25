class User < ApplicationRecord
  has_many :articles
  has_many :user_categories
  has_many :categories, through: :user_categories
  validates :email, uniqueness: true

  has_secure_password
end
