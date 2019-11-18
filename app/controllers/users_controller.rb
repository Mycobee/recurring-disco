class UsersController < ApplicationController
	def new
    @user = User.new
	end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Registration Successful! You are now logged in."
      redirect_to profile_path(user)
    else
      flash.now[:danger] = user.errors.full_messages
      user.update(email: "", password: "")
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :street_address, :city, :state, :zip_code, :email, :password, :password_confirmation)
  end
end
