class User < ApplicationRecord
  # Relationships
  has_many :recipes

  # To enable password encryption with bcrypt
  has_secure_password

  # Validations
  validates :username, presence: true, uniqueness: true
end
