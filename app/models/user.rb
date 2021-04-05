class User < ApplicationRecord
    has_many :reviews
    has_many :strains, through: :reviews
    has_many :favorite_strains
    # has_many :favorites, through: :favorite_strains, source: strain
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true
    validates :password, :birthday, presence: true

    def standard_date
        self.birthday.strftime("%b %d, %Y")
    end

    def of_age?
        this_year = DateTime.now.strftime("%Y").to_i
        birth_year = birthday.strftime("%Y").to_i
        age = this_year - birth_year
        if age < 21
            false
        else
            true
        end
    end
end
