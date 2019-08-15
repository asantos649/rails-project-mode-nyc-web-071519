class Concert < ApplicationRecord
    has_many :user_concerts
    has_many :users, through: :user_concerts
    has_many :performances
    has_many :bands, through: :performances

    def num_headliners
        performances.where(opener: false).length
    end

    def headliners
        num_bands = self.num_headliners
        case num_bands
        when 1
            self.bands.first.name.titleize
        when 2
            "#{self.bands.first.name.titleize} & #{self.bands.second.name.titleize}"
        else
            bands = self.bands.map {|band| band.name}
            bands[-1] = "& #{bands[-1]}"
            bands.join(", ").titleize
        end
    end
end
