class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reading, polymorphic: true
  validates :review, presence: true, allow_blank: false
  validates_numericality_of :vote, presence: true, numericality:{:greater_than_or_equal_to => 0}
end
