class UserConcertsController < ApplicationController
    def show
        @user_concert = UserConcert.find(params[:id])
    end

    def new
        @user_concert = UserConcert.new
        @concerts = Concert.ordered_list
    end

    def create 
        # byebug
        @user_concert = UserConcert.new(user_concert_params)
        if @user_concert.valid?
            @user_concert.save
            redirect_to user_path(session[:user])
        else
            flash[:errors] = @user_concert.errors.full_messages
            redirect_to new_user_concert_path(session[:user])
        end
    end

    def edit
        @user_concert = UserConcert.find(params[:id])
        @concerts = Concert.ordered_list
    end

    def update
        @user_concert = UserConcert.find(params[:id])
        # @user_concert.update(user_concert_params)
        # redirect_to user_path(session[:user])
        temp_user_concert = UserConcert.new(user_concert_params)
        if temp_user_concert.valid?
            @user_concert.update(user_concert_params)
            redirect_to user_path(session[:user])
        else
            flash[:errors] = temp_user_concert.errors.full_messages
            redirect_to edit_user_concert_path(@user_concert)
        end
    end

    def destroy
        UserConcert.find(params[:id]).destroy
        redirect_to user_path(session[:user])
    end

    private

    def user_concert_params
        parameters = params.require(:user_concert).permit(:favorite, :rating, :concert_id, :favorite_song)
        parameters[:user_id] = session[:user]
        parameters
    end
end
