class Strain < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  has_many :favorite_strains
  # has_many :favorited_by, through: :favorite_strains, source: :user

end
