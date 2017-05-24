class Category < ApplicationRecord
  has_and_belongs_to_many :books
  has_many :children, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category", required: false
  validates :title, presence: true, allow_blank: false

  def add_book(book)
    books << book unless books.include?(book)
  end
end
