class SavedStrain < ApplicationRecord
  belongs_to :user
  belongs_to :strain
end
