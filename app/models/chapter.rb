class Chapter < ApplicationRecord
  has_many :contents
  belongs_to :reading, polymorphic: true
  has_many :images, :through => :contents, :source => :content_element, :source_type => 'ImageContent'
  has_many :texts, :through => :contents, :source => :content_element, :source_type => 'TextContent'

  validates :no, presence: true, length: {maximum: 10}, allow_blank: false
  validates :title, presence: true, length: {maximum: 50},
            allow_blank: false, uniqueness: true

end
