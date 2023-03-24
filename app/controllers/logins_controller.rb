class LoginsController < ApplicationController

    def show
        @login = Signup.find(params[:id])
    end

    def new
        # flash[:notice] = "You have successfully logged out."
    end

    def create
        # debugger
        
        login = Signup.find_by(email: params[:email])
        if login && login.authenticate(params[:password])
            session[:current_user_id] = login.id
            redirect_to signups_path
        else
            flash.now.alert = "email or password invalid"
            render :new, status: :unprocessable_entity
        end
    end

  
    
    private
    def login_params
        params.require(:login).permit(:email, :password)
    end 
end
