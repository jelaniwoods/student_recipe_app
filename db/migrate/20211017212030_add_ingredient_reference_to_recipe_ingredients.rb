class AddIngredientReferenceToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_ingredients, :ingredients
    add_index :recipe_ingredients, :ingredient_id
    change_column_null :recipe_ingredients, :ingredient_id, false
  end
end
