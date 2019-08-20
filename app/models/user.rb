class User < ApplicationRecord
    has_many :user_concerts
    has_many :concerts, through: :user_concerts

    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
