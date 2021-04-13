class Strain < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  has_many :favorite_strains
  has_many :favorited_by, through: :favorite_strains, source: :user

  validates :name, presence: true, uniqueness: true
  # scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%")}

  def self.by_thc_content
    self.order(thc_content: :desc)
  end

  def self.search_by_name(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def self.most_reviewed
      order(review_count: :desc).first
  end

  def name_without_whtespaces_and_capitalized
    n = name.strip.split.collect {|word| word.to_s.capitalize}
    n.join(" ")
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

  def review_count
    self.reviews.length
  end
end
