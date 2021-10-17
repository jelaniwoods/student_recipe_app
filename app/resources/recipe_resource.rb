class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :instructions, :string
  attribute :total_time, :integer
  attribute :image, :string
  attribute :category_id, :integer

  # Direct associations

  belongs_to :category

  has_many   :recipe_ingredients

  # Indirect associations

  many_to_many :ingredients
end
