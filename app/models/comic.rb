class Comic < ApplicationRecord
  has_many :reviews, as: :reading
  has_many :subscribes, as: :reading
  has_many :author_readings, as: :reading
  has_many :category_readings, as: :reading
  has_many :chapters, as: :reading
  has_many :authors, :through => :author_readings
  has_many :categories, :through => :category_readings

  validates :title, presence: true, allow_blank: false

  def add_author(author)
    authors << author unless authors.include?(author)
  end

  def add_category(category)
    categories << category unless categories.include?(category)
  end
end
