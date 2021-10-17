class RecipeIngredient < ApplicationRecord
  # Direct associations

  belongs_to :ingredient

  belongs_to :recipe

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    amount
  end
end
