require "rails_helper"

RSpec.describe RecipeIngredient, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:ingredient) }

    it { should belong_to(:recipe) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:amount) }

    it { should validate_presence_of(:units) }
  end
end
