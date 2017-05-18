class User < ApplicationRecord
  has_many :reviews
  has_many :orders
  has_many :comments
  has_many :subscribes

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }, allow_blank: false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }, allow_blank: false

  has_secure_password
end
