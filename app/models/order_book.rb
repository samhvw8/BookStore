class OrderBook < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :price, presence: true, numericality: {:greater_than_or_equal_to => 0}
  validates_numericality_of :qty, presence: true, numericality: {:only_integer => true, :greater_than_or_equal_to => 0}

end
