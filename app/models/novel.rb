class Novel < ApplicationRecord
  has_many :reviews, as: :reading
  has_many :subscribes, as: :reading
  has_many :author_readings, as: :reading
  has_many :category_readings, as: :reading
  has_many :chapters, as: :reading
  has_many :authors, :through => :author_readings
  has_many :categories, :through => :category_readings
  scope :search, -> (keyword) { where("title LIKE ?" , "%#{keyword}%") }

  has_attached_file :cover, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true, allow_blank: false

  def add_author(author)
    authors << author unless authors.include?(author)
  end

  def add_category(category)
    categories << category unless categories.include?(category)
  end


end
