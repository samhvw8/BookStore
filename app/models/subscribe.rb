class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :reading, polymorphic: true

  has_one :self_ref, :class_name => self, :foreign_key => :id

  has_one :comic, :through => :self_ref, :source => :reading, :source_type => 'Comic'
  has_one :novel, :through => :self_ref, :source => :reading, :source_type => 'Novel'
end
