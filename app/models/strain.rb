class Strain < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  has_many :favorite_strains
  has_many :favorited_by, through: :favorite_strains, source: :user

  validates :name, presence: true, uniqueness: true
  # scope :search_by_name, -> (search) {where("name LIKE, ?", "#{search}%")}

  def self.by_thc_content
    self.order(thc_content: :desc)
  end

  def self.search_by_name(search)
    if search
      where("name LIKE, ?", "#{search}%")
    else
      all
    end
  end
end
