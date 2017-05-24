class Author < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :bio, presence: true

  def add_book(book)
    books << book unless books.include?(book)
  end
end
