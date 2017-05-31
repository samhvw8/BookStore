class Category < ApplicationRecord
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :parent, :class_name => 'Category', required: false
  validates :title, presence: true, allow_blank: false
  has_many :category_readings
  has_many :comics, :through => :category_readings, :source => :reading, :source_type => 'Comic'
  has_many :novels, :through => :category_readings, :source => :reading, :source_type => 'Novel'

  scope :search, -> (keyword) { where("title LIKE ?" , "%#{keyword}%") }
  def add_comic(comic)
    comics << comic unless comics.include?(comic)
  end

  def add_novel(novel)
    novels << novel unless novels.include?(novel)
  end

end
