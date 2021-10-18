class RecipeIngredient < ApplicationRecord
  # Direct associations

  belongs_to :ingredient

  belongs_to :recipe

  # Indirect associations

  # Validations

  validates :amount, presence: true

  validates :units, presence: true

  # Scopes

  def to_s
    amount
  end
end
