class TextContent < ApplicationRecord
  has_one :content, :as =>:content_element
  has_one :chapter, :through => :content

  validates :txt_content, presence: true, allow_blank: false
end
