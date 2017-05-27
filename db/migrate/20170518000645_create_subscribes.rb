class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :reading, polymorphic: true, index: true
      t.boolean :availabe, default: false
      t.timestamps
    end
  end
end
