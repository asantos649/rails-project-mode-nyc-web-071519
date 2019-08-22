class SessionsController < ApplicationController
#   layout false
#   layout 'application', :except => :login

    skip_before_action :authorized, except: :destroy
    helper_method :user
    # helper_method :validate

    def login
        
        render "/login.html.erb"#, :layout => false
    end

    def verification
        # byebug
        user = User.find_by(email: params[:email])
        # byebug
        if user && (user.authenticate(params[:password]))
            session[:user] = user.id
            # byebug
            redirect_to user_path(user)
        else
            @error = "Invalid email or password"
            render "/login.html.erb"
        end

    end

    def user
        session[:user] ||= nil
    end

    def destroy
        # byebug
        session.delete(:user)
        # byebug
        redirect_to login_path
    end
end
