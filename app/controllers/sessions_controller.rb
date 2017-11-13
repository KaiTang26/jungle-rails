class SessionsController < ApplicationController

    def new
    end

    def create
        
        if user = User.authenticate_with_credentials(params[:email], params[:password])
            @em = params[:email]
         
            @user = User.find_by_email(@em.strip)
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to sessions_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

   

end
