class Category < ApplicationRecord
  validates :name, presence: true

  has_many :groups, dependent: :destroy
  has_many :recipes, through: :groups
end
