class ApplicationController < ActionController::Base
    helper_method :user
    helper_method :validate
    


    def login
        render "/login.html.erb"
    end

    def verification
        # byebug
        user = User.find_by(email: params[:email])
        if user
            session[:user] = user.id
            byebug
            redirect_to user_path(user)
        else
            redirect_to login_path
        end

    end

    def user
        session[:user] ||= nil
    end

    def check_for_errors
        if flash[:errors]
            flash[:errors].map do |error|
                error
            end
        end
    end

    def bands
        @bands = Band.all
    end

    def find_band
        @band = Band.find(params[:id])
    end

    def concerts
        @concerts = Concert.ordered_list
    end
    
    def find_concert
        @concert = Concert.find(params[:id])
    end

    def find_user_concert
        @user_concert = UserConcert.find(params[:id])
    end

    def find_user
        @user = User.find(params[:id])
    end
end
