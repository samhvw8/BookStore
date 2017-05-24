class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.boolean :availabe, default: false
      t.timestamps
      t.index [:book_id, :user_id], unique: true
    end
  end
end
