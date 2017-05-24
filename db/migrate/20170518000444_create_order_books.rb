class CreateOrderBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :order_books do |t|
      t.belongs_to :order, index: true
      t.belongs_to :book, index: true
      t.integer :qty
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
      t.index [:book_id, :order_id], unique: true
    end
  end
end
