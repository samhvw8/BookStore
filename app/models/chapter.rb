class Chapter < ApplicationRecord
  has_many :contents
  belongs_to :reading, polymorphic: true

  has_one :self_ref, :class_name => self, :foreign_key => :id

  has_one :comic, :through => :self_ref, :source => :reading, :source_type => 'Comic'
  has_one :novel, :through => :self_ref, :source => :reading, :source_type => 'Novel'

  has_many :images, :through => :contents, :source => :content_element, :source_type => 'ImageContent'
  has_many :texts, :through => :contents, :source => :content_element, :source_type => 'TextContent'

  validates :no, presence: true, length: {maximum: 10}, allow_blank: false
  validates :title, presence: true, length: {maximum: 50},
            allow_blank: false

  after_create_commit :subscribe_update

  scope :search, -> (keyword) { where("title LIKE ?" , "%#{keyword}%") }

  def subscribe_update
    if novel.nil?
      comic.subscribes.update_all(available: true, newest_chap: self) unless comic.subscribes.blank?
    else
      novel.subscribes.update_all(available: true, newest_chap: self) unless novel.subscribes.blank?
    end
  end


end
