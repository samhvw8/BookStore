class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :comment, presence: true, allow_blank: false
  validates :price, numericality: true, :greater_than_or_equal_to => 0
  validates_numericality_of :qty, presence: true, :only_integer => true, :greater_than_or_equal_to => 0
end
