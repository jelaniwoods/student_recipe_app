require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "Direct Associations" do
    it { should have_many(:recipe_ingredients) }
  end

  describe "InDirect Associations" do
    it { should have_many(:recipes) }
  end

  describe "Validations" do
  end
end
