class AddAttachmentCoverToNovels < ActiveRecord::Migration
  def self.up
    change_table :novels do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :novels, :cover
  end
end
