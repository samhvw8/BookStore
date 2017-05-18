class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.boolean :is_checkout, default: false
      t.timestamps
    end
  end
end
