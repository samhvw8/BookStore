class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :reviews
  has_many :comments
  has_and_belongs_to_many :authors
  has_many :subscribes
  has_many :order_books

  validates :title, presence: true, allow_blank: false
  validates :price, numericality: {:greater_than => 0}, :on => :update
  validates_numericality_of :qty, numericality: {:greater_than_or_equal_to => 0, :only_integer => true}, :on => :update

  def add_author(author)
    authors << author unless authors.include?(author)
  end

  def add_category(category)
    categories << category unless categories.include?(category)
  end
end
