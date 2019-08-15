class Band < ApplicationRecord
    has_many :performances
    has_many :concerts, through: :performances
end
