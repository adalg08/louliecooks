class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :ingredients
  has_attachment :photo
end
