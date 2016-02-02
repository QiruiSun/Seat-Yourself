class SessionsController < ApplicationController

  before_action :prevent_login_again, only: [:new, :create]

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to restaurants_path, notice: "Logged in"
    else
      flash[:alert] = "Invalid Credentials"
      render :new
    end

  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_path, notice: "Logged out!"
  end

  def prevent_login_again
    if current_user
      redirect_to restaurants_path, notice: "You have already logged in!"
    end
    #code
  end

end
