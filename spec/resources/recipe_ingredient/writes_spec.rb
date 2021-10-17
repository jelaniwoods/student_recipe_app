require "rails_helper"

RSpec.describe RecipeIngredientResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "recipe_ingredients",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RecipeIngredientResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { RecipeIngredient.count }.by(1)
    end
  end

  describe "updating" do
    let!(:recipe_ingredient) { create(:recipe_ingredient) }

    let(:payload) do
      {
        data: {
          id: recipe_ingredient.id.to_s,
          type: "recipe_ingredients",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RecipeIngredientResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { recipe_ingredient.reload.updated_at }
      # .and change { recipe_ingredient.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:recipe_ingredient) { create(:recipe_ingredient) }

    let(:instance) do
      RecipeIngredientResource.find(id: recipe_ingredient.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { RecipeIngredient.count }.by(-1)
    end
  end
end
