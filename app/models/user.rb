class User < ApplicationRecord
    has_many :reviews
    has_many :strains, through: :reviews
    has_many :saved_strains
    has_many :saved, through: :saved_strains, source: strain

    has_secure_password
end
