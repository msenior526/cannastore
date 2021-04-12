class User < ApplicationRecord
    has_many :reviews, :dependent => :destroy
    has_many :strains, through: :reviews
    has_many :favorite_strains
    has_many :favorites, through: :favorite_strains, source: :strain, :dependent => :destroy
    has_one_attached :profile_picture
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true

    def standard_date
        self.birthday.strftime("%b %d, %Y")
    end


    def google_account
        if uid && provider
            true
        else
            false
        end
    end
end
