class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :subcategory, null: false
      t.string :subcategory_other_title
      t.string :cooking_method
      t.boolean :sparkling, null: false, default: false

      t.timestamps
    end
  end
end
