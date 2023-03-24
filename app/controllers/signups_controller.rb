class SignupsController < ApplicationController
    def index
        @signup = Signup.all
      end
    
    def show
        @signup = Signup.find(params[:id])
    end

    def new
        @signup = Signup.new
    end

    def create
        @signup = Signup.new(client_params)

        if @signup.save
          redirect_to new_login_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      def destroy
        # Remove the user id from the session
        
        session.delete(:current_user_id)
        # Clear the memoized current user
        @_current_user = nil
        flash[:notice] = "You have successfully logged out."
        redirect_to new_login_path
    end

      private
      def client_params
        params.require(:signup).permit(:email, :password)
      end 
end
