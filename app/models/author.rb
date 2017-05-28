class Author < ApplicationRecord

  has_many :author_readings

  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :bio, presence: true

  def readings
    author_reading.map(&:reading)
  end

  def add_book(reading)
    readings << reading unless readings.include?(reading)
  end
end
