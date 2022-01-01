namespace :dev do
  desc "Pre-populate database with dummy data"
  task prime: :environment do
    require "open-uri"
    
    category_url = "http://www.themealdb.com/api/json/v1/1/categories.php"
    category_json = URI.open(category_url).read
    cjson = JSON.parse(category_json)
    categories = cjson["categories"]
    # categories.each do |cat|
    #   params = { id: cat["idCategory"], name: cat["strCategory"], image: cat["strCategoryThumb"] }
    #   cat = Category.find_or_create_by(params)
    # end
    p "Categories: " + Category.count.to_s

    meal_url = "https://www.themealdb.com/api/json/v1/1/search.php?f=p"
    meal_json = URI.open(meal_url).read
    mjson = JSON.parse meal_json
    meals = mjson["meals"]
    meals.each do |meal|
      cat = Category.find_by(name: meal["strCategory"])
      recipes_params = {id: meal["idMeal"], name: meal["strMeal"], instructions: meal["strInstructions"], image: meal["strMealThumb"], category_id: cat.id}
      r = Recipe.find_or_create_by(recipes_params)
      p r.errors.full_messages
      ingredient_params = "strIngredient"
      20.times do |n|
        mm = ingredient_params + (n+1).to_s
        v = meal[mm]
        if !v.nil? && !v.empty?
          h = {name: v}
          Ingredient.find_or_create_by(h)
        end
      end
      p "Ingredient: #{Ingredient.count}"
      recipe_ingredient_params = "strMeasure"
      20.times do |n|
        mm = recipe_ingredient_params + (n+1).to_s
        v = meal[mm]
        if !v.nil? && !v.empty?
          # p v
          amount = v.split(/\D/).reject(&:empty?)&.last&.strip
          amount = v.split.first if amount.nil?
          units = v.split(/\d/).reject(&:empty?)&.last&.strip

          i = Ingredient.find_by({ name: meal["strIngredient#{n+1}"]}).id
          p i
          h = {recipe_id: meal["idMeal"], ingredient_id: i, amount: amount, units: units}
          ri = RecipeIngredient.find_or_create_by(h)
          p ri.errors.full_messages
        end
        p "RecipeIngredients: #{RecipeIngredient.count}"
      end
    end
    p "Recipes: #{Recipe.count}"
  end
end
