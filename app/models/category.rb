class Category < ApplicationRecord
    has_many :strains

    validates :name, presence: true
end
