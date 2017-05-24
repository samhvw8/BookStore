class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.text :comment
      t.timestamps
    end
  end
end
