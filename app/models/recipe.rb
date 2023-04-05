class Recipe < ApplicationRecord
  belongs_to :user

  # validations
  validates :title, presence:true
  validates :instructions, length: { minimum: 50 }
end
