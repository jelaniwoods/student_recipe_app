require "rails_helper"

RSpec.describe "recipe_ingredients#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_ingredients/#{recipe_ingredient.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:recipe_ingredient) { create(:recipe_ingredient) }

    it "works" do
      expect(RecipeIngredientResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("recipe_ingredients")
      expect(d.id).to eq(recipe_ingredient.id)
    end
  end
end
