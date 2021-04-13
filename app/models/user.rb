class User < ApplicationRecord
    has_many :reviews, :dependent => :destroy
    has_many :strains, through: :reviews
    has_many :favorite_strains
    has_many :favorites, through: :favorite_strains, source: :strain, :dependent => :destroy
    has_one_attached :profile_picture
    has_secure_password

    #validate :of_age?, unless: :google_account
    validates :username, :email, presence: true, uniqueness: true
    validates :profile_picture, content_type: {in: %w[image/jpeg image/gif image/png image/pdf],
                                            message: "must be a valid image format"}

    # def standard_date
    #     self.birthday.strftime("%b %d, %Y")
    # end

    # def of_age?
    #     this_year = DateTime.now.strftime("%Y").to_i
    #     birth_year = birthday.strftime("%Y").to_i
    #     age = this_year - birth_year
    #     if age < 21
    #         false 
    #         errors.add(:birthday, "have to be at least 21 years old")
    #     else
    #         true
    #     end
    # end
    def display_profile_picture
        if profile_picture
            profile_picture.variant(resize_to_limit: [300, 300])
        end
    end

    def google_account
        if uid && provider
            true
        else
            false
        end
    end
end
