class Ingredient < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :recipe_ingredients,
             dependent: :destroy

  # Indirect associations

  has_many   :recipes,
             through: :recipe_ingredients,
             source: :recipe

  # Validations

  # Scopes

  def to_s
    name
  end
end
