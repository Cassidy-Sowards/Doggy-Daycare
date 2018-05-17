class SessionsController < ApplicationController
  def new
  end

  def create

   user = User.find_by_email(params[:session][:email]) 
   if user && user.authenticate(params[:session][:password])
   session[:user_id] = user.id  
   flash.now[:succces] = "Log in successful"
   redirect_to root_url
   else             
    flash.now[:danger] = "Invalid name/password combination."      
    render 'new'                  
   end

  end

  def destroy
    if logged_in?
        session[:user_id] = nil 
        flash[:success] = "User successfully logged out"
    else
        flash[:notice] = "You need to sign in first"    
    end
      
     redirect_to root_url
  end
end
