class UserConcert < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
end
