json.extract! recipe_ingredient, :id, :recipe_id, :ingredient_id, :amount,
              :units, :created_at, :updated_at
json.url recipe_ingredient_url(recipe_ingredient, format: :json)
