class RecipeIngredientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :ingredient_id, :integer
  attribute :amount, :integer
  attribute :units, :string
  attribute :tmp, :string

  # Direct associations

  belongs_to :ingredient

  belongs_to :recipe

  # Indirect associations
end
