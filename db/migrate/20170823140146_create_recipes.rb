class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.integer :expense
      t.integer :time
      t.string :memo

      t.timestamps
    end
  end
end
