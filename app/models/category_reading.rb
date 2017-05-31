class CategoryReading < ApplicationRecord
  belongs_to :category
  belongs_to :reading, polymorphic: true
end
