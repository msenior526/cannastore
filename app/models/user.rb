class User < ApplicationRecord
    has_many :reviews
    has_many :strains, through: :reviews
    has_many :favorite_strains
    # has_many :favorites, through: :favorite_strains, source: strain
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true
    validates :password, :birthday, presence: true
end
