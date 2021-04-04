class User < ApplicationRecord
    has_many :reviews
    has_many :strains, through: :reviews
    has_secure_password
end
