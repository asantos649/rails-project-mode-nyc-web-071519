class UserConcertsController < ApplicationController
    def show
        @user_concert = UserConcert.find(params[:id])
    end

    def new
        @user_concert = UserConcert.new
        @concerts = Concert.all
    end

    def create
        byebug
    end

    def edit

    end

    def update

    end

    def destroy

    end
end
