class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :total_time
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
