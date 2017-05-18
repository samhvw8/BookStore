class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :review, presence: true, allow_blank: false
  validates_numericality_of :vote, presence: true, :greater_than_or_equal_to => 0
end
