class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :reading, polymorphic: true

end
