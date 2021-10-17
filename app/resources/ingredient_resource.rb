class IngredientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :image, :string

  # Direct associations

  has_many :recipe_ingredients

  # Indirect associations

  many_to_many :recipes
end
