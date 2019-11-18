class SessionsController < ApplicationController
  def new
    if current_user
      flash[:warning] = "You are already logged in."
      redirect_user(current_user)
    end
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are now logged in!"
      redirect_user(user)
    else
      flash.now[:danger] = "Sorry, that email and password don't match."
      render :new
    end
  end

  private

  def redirect_user(user)
    if user.default?
      redirect_to profile_path(current_user)
    elsif user.admin?
      redirect_to root_path
    end
  end
end
