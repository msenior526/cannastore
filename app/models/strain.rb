class Strain < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  has_many :favorite_strains
  has_many :favorited_by, through: :favorite_strains, source: :user

  validates :name, presence: true, uniqueness: true

  def self.by_thc_content
    self.order(thc_content: :desc)
  end
end
