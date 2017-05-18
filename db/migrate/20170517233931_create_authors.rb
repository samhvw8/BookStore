class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name, unique: true
      t.string :bio
      t.timestamps
    end
  end
end
