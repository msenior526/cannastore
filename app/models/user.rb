class User < ApplicationRecord
    has_many :reviews
    has_many :strains, through: :reviews
    has_many :saved_strains

    has_secure_password
end
