class UsersController < ApplicationController
	def new
    @user = User.new
	end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Registration Successful! You are now logged in."
      redirect_to articles_path
    else
      flash.now[:danger] = @user.errors.full_messages
      @user.attributes = { email: "", password: "" }
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :street_address, :city, :state, :zip_code, :email, :password, :password_confirmation)
  end
end
