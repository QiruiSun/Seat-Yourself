class UsersController < ApplicationController

  before_action :current_user only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to restaurants_path, notice: "Signed up"
    else
      render :new
    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
#code
  end


end
