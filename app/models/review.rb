class Review < ApplicationRecord
  belongs_to :user
  belongs_to :strain, counter_cache: true

  validates :context, :rating, presence: true
  validates :context, length: {maximum: 200}
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 11 }

  # Add user to validates associated
  validates_associated :strain, :user
    # def self.strain_most_reviewed
    #   includes(:strain).group(:strain_id).order("strain_id desc").limit(1).count
    # end
end
