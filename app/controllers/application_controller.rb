class ApplicationController < ActionController::Base
    private
    def current_user
        @_current_user = @_current_user || Signup.find(session[:current_user_id]) if session[:current_user_id]
    end
helper_method :current_user
end
