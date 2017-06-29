class Category < ApplicationRecord
  validates :name, presence: true

  has_many :groups
  has_many :recipes, through: :groups
end
