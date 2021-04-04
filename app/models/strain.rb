class Strain < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  has_many :saved_strains
  has_many :saved_by, through: :saved_strains, source: user

end
