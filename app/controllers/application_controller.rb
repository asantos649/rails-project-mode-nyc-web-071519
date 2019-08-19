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
end
