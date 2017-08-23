class CreateRecipeProcesses < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_processes do |t|
      t.integer :recipe_id
      t.string :text

      t.timestamps
    end
  end
end
