class Category < ApplicationRecord
  has_many :children, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category", required: false
  validates :title, presence: true, allow_blank: false
  has_many :category_readings

  def readings
    category_readings.map(&:reading)
  end


  def add_reading(reading)
    readings << reading unless readings.include?(reading)
  end
end
