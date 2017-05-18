class Category < ApplicationRecord
  has_and_belongs_to_many :books
  has_many :children, :class_name => "Category"
  belongs_to :parent, :class_name => "Category"
  validates :title, presence: true, allow_blank: false
end
