class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :reading, polymorphic: true
  belongs_to :current_chap, :class_name => 'Chapter', required: false
  belongs_to :newest_chap, :class_name => 'Chapter', required: false

  has_one :self_ref, :class_name => self, :foreign_key => :id

  has_one :comic, :through => :self_ref, :source => :reading, :source_type => 'Comic'
  has_one :novel, :through => :self_ref, :source => :reading, :source_type => 'Novel'

  validates_uniqueness_of :user_id, :scope => :reading_id

  after_update_commit :update_subscribe
  after_create_commit :after_create_handle

  def update_subscribe
    update(available: false) if (current_chap == newest_chap) and available
  end


  def after_create_handle
    chap = nil
    if novel.nil?
      # comic
      chap = comic.chapters.order('created_at DESC').first
    else
      # novel
      chap = novel.chapters.order('created_at DESC').first
    end

    unless chap.nil?
      self.update_column(:available, true)
      self.update_column(:newest_chap_id, chap.id)
    end
  end

end
