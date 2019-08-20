class ConcertsController < ApplicationController
    before_action :concerts, only: :index
    before_action :find_concert, only: :show

    def show
    end

    def index
    end
    
end
