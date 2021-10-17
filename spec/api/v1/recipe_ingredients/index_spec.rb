require "rails_helper"

RSpec.describe "recipe_ingredients#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_ingredients", params: params
  end

  describe "basic fetch" do
    let!(:recipe_ingredient1) { create(:recipe_ingredient) }
    let!(:recipe_ingredient2) { create(:recipe_ingredient) }

    it "works" do
      expect(RecipeIngredientResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["recipe_ingredients"])
      expect(d.map(&:id)).to match_array([recipe_ingredient1.id,
                                          recipe_ingredient2.id])
    end
  end
end
