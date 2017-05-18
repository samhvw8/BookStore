class OrderBook < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :price, numericality: true, :greater_than_or_equal_to => 0
  validates_numericality_of :qty, presence: true, :only_integer => true, :greater_than_or_equal_to => 0
end
