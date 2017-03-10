class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :kitchen
      t.string :kind_of_food
      t.string :yield
      t.string :preparation_time
      t.string :difficulty_level
      t.string :ingredients
      t.string :method_of_preparation

      t.timestamps
    end
  end
end
