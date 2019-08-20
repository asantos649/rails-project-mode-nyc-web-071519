class UserConcert < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 10}, if: :rating

  def self.filter_list(user_id, hash)
    user_concerts = UserConcert.where(user_id: user_id)
    if !!hash[:band] && (hash[:band] != '')
      user_concerts = user_concerts.select do|uc| 
        band_names = uc.concert.bands.map{|b|b.name}
        band_names.include?(hash[:band])
      end
    end
    if !!hash[:location] && (hash[:location] != '')
      user_concerts = user_concerts.select{|uc| uc.concert.location.include?(hash[:location])}
    end
    if !!hash[:rating] && (hash[:rating] != '')
      user_concerts = user_concerts.select do |uc|
        uc.rating >= hash[:rating].to_i if uc.rating
      end
    end
    if !!hash[:date] && (hash[:date] != '')
      user_concerts = user_concerts.select{|uc| uc.concert.date_and_time.to_date == hash[:date].to_date}
    end
    if hash[:favorite] != nil
      user_concerts = user_concerts.select{|uc| uc.favorite}
    end
    user_concerts
  end
end
