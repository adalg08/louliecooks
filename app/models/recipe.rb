class Recipe < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :compositions, dependent: :destroy
  has_many :ingredients, through: :compositions
  has_many :groups
  has_many :categories, through: :groups
  has_attachment :photo
end
