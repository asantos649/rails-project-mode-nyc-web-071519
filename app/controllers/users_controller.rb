class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show
        @filter = Filter.new({})
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

    end

    def update

        @user.update(params.require(:user).permit(:name, :email))
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to login_path
    end

    def filter
       @shows = UserConcert.filter_list(params[:user], params)
       @user = User.find(params[:user])
       @show_unfilter = true
       @filter = create_filter(params)
       render "users/show.html.erb"
    end

    def create_filter (params_hash)
        filter = Filter.new(params_hash)
        # message_hash = {}
        # if params_hash[:band] != ''
        #     message_hash[:band] = params_hash[:band]
        #   elsif params_hash[:location] != ''
        #     message_hash[:location] = params_hash[:location]
        #   elsif params_hash[:rating] != ''
        #     message_hash[:rating] = params_hash[:rating]
        #   elsif params_hash[:date] != ''
        #     message_hash[:date] = params_hash[:date]
        #   elsif params_hash[:favorite] != nil
        #     message_hash[:favorite] = params_hash[:favorite]
        #   end
        #   message_hash
        filter
    end
end
