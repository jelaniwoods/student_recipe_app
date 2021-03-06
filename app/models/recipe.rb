class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :category

  has_many   :recipe_ingredients,
             dependent: :destroy

  # Indirect associations

  has_many   :ingredients,
             through: :recipe_ingredients,
             source: :ingredient

  # Validations

  validates :instructions, presence: true

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
