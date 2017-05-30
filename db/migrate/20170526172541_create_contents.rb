class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.belongs_to :chapter, index: true
      t.belongs_to :content_element, polymorphic: true, index: true
      t.timestamps
    end
  end
end
