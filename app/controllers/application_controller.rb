class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    before_action :authorized

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

    def check_for_errors
        if flash[:errors]
            flash[:errors].map do |error|
                error
            end
        end
    end

    def current_user
        @user = User.find_by(id: session[:user])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end
end
