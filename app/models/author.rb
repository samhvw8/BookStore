class Author < ApplicationRecord

  has_many :author_readings
  has_many :comics, :through => :author_readings, :source => :reading, :source_type => 'Comic'
  has_many :novels, :through => :author_readings, :source => :reading, :source_type => 'Novel'

  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :bio, presence: true

  scope :search, -> (keyword) { where("name LIKE ?" , "%#{keyword}%") }

  def add_comic(comic)
    comics << comic unless comics.include?(comic)
  end

  def add_novel(novel)
    novels << novel unless novels.include?(novel)
  end


end
