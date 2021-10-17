require "rails_helper"

RSpec.describe "recipe_ingredients#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipe_ingredients/#{recipe_ingredient.id}", payload
  end

  describe "basic update" do
    let!(:recipe_ingredient) { create(:recipe_ingredient) }

    let(:payload) do
      {
        data: {
          id: recipe_ingredient.id.to_s,
          type: "recipe_ingredients",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RecipeIngredientResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { recipe_ingredient.reload.attributes }
    end
  end
end
