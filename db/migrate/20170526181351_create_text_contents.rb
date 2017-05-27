class CreateTextContents < ActiveRecord::Migration[5.0]
  def change
    create_table :text_contents do |t|
      t.text :txt_content
      t.timestamps
    end
  end
end
