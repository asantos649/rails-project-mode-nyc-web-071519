class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @shows = UserConcert.where(user_id: @user.id)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:name, :email))
        redirect_to user_path(@user)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(params.require(:user).permit(:name, :email))
        redirect_to user_path(@user)
    end

    def destroy
        User.find(params[:id]).destroy
        # redirect to login page
    end
end
