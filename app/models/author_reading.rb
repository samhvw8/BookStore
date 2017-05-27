class AuthorReading < ApplicationRecord
  belongs_to :author
  belongs_to :reading, polymorphic: true


end
