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
        when 0
            "To be Announced"
        else
            bands = self.bands.map {|band| band.name}
            bands[-1] = "& #{bands[-1]}"
            bands.join(", ").titleize
        end
    end

    def date
        date_and_time.in_time_zone('Eastern Time (US & Canada)').strftime("%A, %B %d, %Y")
    end

    def time
        date_and_time.in_time_zone('Eastern Time (US & Canada)').strftime("%l %p")
    end

    def display
        if name
            "#{date} #{time} - #{name}: Featuring #{headliners} - #{location}"
        else
            "#{date} #{time} - #{headliners} - #{location}"
        end
    end

    def self.ordered_list
        Concert.all.sort_by{|c| c.date_and_time}.reverse
    end
end
