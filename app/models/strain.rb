class Strain < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  has_many :favorite_strains
  has_many :favorited_by, through: :favorite_strains, source: :user

  validates :name, presence: true, uniqueness: true
  scope :most_reviews, ->{ order(reviews_count: :desc) }
  scope :by_thc_content, ->{ order(thc_content: :desc) }

  def self.search_by_name(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def average_rating
    if reviews.empty?
      n = "No reviews"
    else
      n = reviews.collect do |review|
        review.rating
    end
    n.sum / n.length
  end
  end

  def category_name
    self.category.name
  end
end
