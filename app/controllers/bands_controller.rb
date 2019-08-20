class BandsController < ApplicationController
    before_action :bands, only: :index
    before_action :find_band, only: :show

    
    def index
        
    end

    def show
        
    end
end
