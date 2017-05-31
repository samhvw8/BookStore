class AddAttachmentCoverToComics < ActiveRecord::Migration
  def self.up
    change_table :comics do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :comics, :cover
  end
end
