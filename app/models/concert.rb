class Concert < ApplicationRecord
    has_many :user_concerts
    has_many :users, through: :user_concerts
    has_many :performances
    has_many :bands, through: :performances
end
