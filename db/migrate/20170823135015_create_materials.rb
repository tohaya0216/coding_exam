class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.integer :recipe_id
      t.string :name
      t.string :amount

      t.timestamps
    end
  end
end
