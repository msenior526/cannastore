class Review < ApplicationRecord
  belongs_to :user
  belongs_to :strain

  validates :context, :rating, presence: true
  validates :context, length: {maximum: 200}
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 11 }
  validates_associated :strain, :user
end
