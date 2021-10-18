require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:category) }

    it { should have_many(:recipe_ingredients) }
  end

  describe "InDirect Associations" do
    it { should have_many(:ingredients) }
  end

  describe "Validations" do
    it { should validate_presence_of(:instructions) }

    it { should validate_presence_of(:name) }
  end
end
