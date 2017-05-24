class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :parent
      t.string :title
      t.timestamps
    end
  end
end
