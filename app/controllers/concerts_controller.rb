class ConcertsController < ApplicationController
    def show
        @concert = Concert.find(params[:id])
    end

    def index
        @concerts = Concert.ordered_list
    end
    
end
