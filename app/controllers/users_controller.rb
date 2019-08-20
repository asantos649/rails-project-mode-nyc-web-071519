class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy, :authorize_user]
    before_action :authorize_user, only: [:show, :new, :create, :edit, :update, :destroy]

    def show
        @filter = Filter.new({})
        @shows = UserConcert.where(user_id: @user.id)
    end

    def new
        @user = User.new
       
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :email, :password))
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit

    end

    def update
        # temp_user = User.new(params.require(:user).permit(:name, :email, :password))
        # if temp_user.valid?
        #     @user.update(params.require(:user).permit(:name, :email, :password))
        #     redirect_to user_path(@user)
        # else
        #     flash[:errors] = temp_user.errors.full_messages
        #     redirect_to edit_user_path
        # end

        @user.attributes = params.require(:user).permit(:name, :email, :password)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def destroy
        @user.destroy
        redirect_to login_path
    end

    def filter
       @shows = UserConcert.filter_list(params[:user], params)
       @user = User.find(params[:user])
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

    def authorize_user
        redirect_to user_path(session[:user]) unless @user == current_user
    end
end
