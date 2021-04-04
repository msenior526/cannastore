class FavoriteStrain < ApplicationRecord
  belongs_to :user
  belongs_to :strain
end
