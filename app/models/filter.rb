class Filter
    attr_accessor :band, :location, :rating, :favorite, :date
    attr_reader :hide_unfilter

    def initialize (hash)
        @band = hash[:band] unless hash[:band] == ""
        @location = hash[:location] unless hash[:location] == ""
        @rating = hash[:rating] unless hash[:rating] == ""
        @favorite = hash[:favorite]
        @date = hash[:date] unless hash[:date] == ""
        @hide_unfilter = self.is_empty?
    end

    def is_empty?
        !(@band || @location || @rating || @favorite || @date)
    end
end