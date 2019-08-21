class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :destroy, :authorize_user]
    before_action :authorize_user, only: [:edit, :update, :destroy]
    skip_before_action :authorized, only: [:new, :create]
    

    def show
        @user = User.find(params[:id])
        @filter = Filter.new({})
        @shows = UserConcert.where(user_id: @user.id)
        if @user.id == session[:user]
            render "users/show.html.erb"
        else
            render "users/public_show.html.erb"
        end
    end

    # def public_show
    #     @filter = Filter.new({})
    #     @other_user = @user
    #     @other_filter = @filter
    #     @shows = UserConcert.where(user_id: @other_user.id)
    # end

    def new
        @user = User.new
       
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :email, :password))
        if @user.valid?
            @user.save
            session[:user] = @user.id
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
       # byebug
       @shows = UserConcert.filter_list(params[:user], params)
       @user = User.find(params[:user])
       @filter = create_filter(params)
    #    @other_user = @user
    #    @other_filter = @filter
       if @user.id == session[:user]
            render "users/show.html.erb"
       else
            render "users/public_show.html.erb"
        end
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
        # # make sure the title of the public show page matches the name of the user you're seeing
        # @user = User.find(params[:id])
        # @filter = Filter.new({})
        # @shows = UserConcert.where(user_id: @user.id)
        # @other_user = @user
        # @other_filter = @filter
        # # @other_shows = @shows
        # # byebug
        # render "users/public_show.html.erb" unless @user == current_user
        redirect_to user_path(@user) unless @user.id == session[:user]
    end

    def search
        @user = User.find_by(email: params[:email])
        redirect_to user_path(@user)
    end
end
