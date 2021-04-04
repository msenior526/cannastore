class Review < ApplicationRecord
  belongs_to :user
  belongs_to :strain

  validates :context, :rating, presence: true
  validates_associated :strain, :user
end
