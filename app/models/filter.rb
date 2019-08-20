class Filter
    attr_accessor :band, :location, :rating, :favorite, :date


    def initialize (hash)
        @band = hash[:band]
        @location = hash[:location]
        @rating = hash[:rating]
        @favorite = hash[:favorite]
        @date = hash[:date]
    end

end