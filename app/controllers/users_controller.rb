class UsersController < ApplicationController
	def new
    @user = User.new
	end

  def create
    user = User.create(user_params)
    if user
      flash[:success] = "Account successfully created!"
      redirect_to(profile_path(user))
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :street_address, :city, :state, :zip_code, :email, :password, :password_confirmation)
  end
end
