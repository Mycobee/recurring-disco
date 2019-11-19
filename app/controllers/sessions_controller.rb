class SessionsController < ApplicationController
  def new
    if current_user
      flash[:warning] = "You are already logged in."
      redirect_to articles_path
    end
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are now logged in!"
      redirect_to articles_path
    else
      flash.now[:danger] = "Sorry, that email and password don't match."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end
