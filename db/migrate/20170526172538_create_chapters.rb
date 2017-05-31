class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.belongs_to :reading, polymorphic: true, index: true
      t.string :no
      t.string :title
      t.integer :viewed, default: 0
      t.timestamps
    end
  end
end
