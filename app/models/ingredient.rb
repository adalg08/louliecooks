class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :compositions
  has_many :recipes, through: :compositions
end
