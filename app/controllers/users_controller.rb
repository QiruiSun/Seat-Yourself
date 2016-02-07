class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @restaurant = @user.restaurants.build
    @categories = Category.all
    #code
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to restaurants_path, notice: "Signed up; 100 loyalty points Added to account!"
    else
      render :new
    end

  end

  def show
    @user = User.find(current_user.id)

    #code
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)

  end

end
