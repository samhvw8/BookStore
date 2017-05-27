class ImageContent < ApplicationRecord
  has_one :content, :as =>:content_element
  has_one :chapter, :through => :content
  has_attached_file :image

  validates_attachment :image,
                       :presence => true,
                       :content_type => {:content_type => /\Aimage\/.*\Z/},
                       :size => {:less_than => 5.megabyte}
end
