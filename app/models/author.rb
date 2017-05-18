class Author < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :bio, presence: true
end
