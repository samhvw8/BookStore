class CreateAuthorReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :author_readings do |t|
      t.belongs_to :author, index: true
      t.belongs_to :reading, polymorphic: true, index: true
      t.timestamps
    end
  end
end
