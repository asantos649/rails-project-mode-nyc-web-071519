class ApplicationController < ActionController::Base
    helper_method :user

    def login
        render "/login.html.erb"
    end

    def verification
        # byebug
        user = User.find_by(email: params[:email])
        if user
            session[:user] = user.id
            redirect_to user_path(user)
        end
    end

    def user
        session[:user] ||= nil
    end
end
