class UserConcertsController < ApplicationController
    def show
        @user_concert = UserConcert.find(params[:id])
    end

    def new
        @user_concert = UserConcert.new
        @concerts = Concert.ordered_list
    end

    def create 
        parameters = user_concert_params
        parameters[:user_id] = session[:user]
        byebug
        @user_concert = UserConcert.create(parameters)

        redirect_to user_path(session[:user])
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def user_concert_params
        params.require(:user_concert).permit(:favorite, :rating, :concert_id, :favorite_song)
    end
end
