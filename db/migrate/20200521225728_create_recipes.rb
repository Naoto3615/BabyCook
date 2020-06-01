class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_image_id
      t.string :title, null:false
      t.text :content, null:false
      t.integer :user_id
      t.timestamps
    end
  end
end
