require "rails_helper"

RSpec.describe "recipe_ingredients#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipe_ingredients/#{recipe_ingredient.id}"
  end

  describe "basic destroy" do
    let!(:recipe_ingredient) { create(:recipe_ingredient) }

    it "updates the resource" do
      expect(RecipeIngredientResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { RecipeIngredient.count }.by(-1)
      expect { recipe_ingredient.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
