require "rails_helper"

RSpec.describe RecipeIngredientResource, type: :resource do
  describe "serialization" do
    let!(:recipe_ingredient) { create(:recipe_ingredient) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recipe_ingredient.id)
      expect(data.jsonapi_type).to eq("recipe_ingredients")
    end
  end

  describe "filtering" do
    let!(:recipe_ingredient1) { create(:recipe_ingredient) }
    let!(:recipe_ingredient2) { create(:recipe_ingredient) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: recipe_ingredient2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([recipe_ingredient2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:recipe_ingredient1) { create(:recipe_ingredient) }
      let!(:recipe_ingredient2) { create(:recipe_ingredient) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_ingredient1.id,
                                      recipe_ingredient2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_ingredient2.id,
                                      recipe_ingredient1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
