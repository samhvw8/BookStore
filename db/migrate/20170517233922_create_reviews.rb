class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true
      t.belongs_to :reading, polymorphic: true, index: true
      t.text :review
      t.decimal :vote, precision: 3, scale: 1
      t.timestamps
    end
  end
end
