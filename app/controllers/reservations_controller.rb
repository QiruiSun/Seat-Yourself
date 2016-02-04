class ReservationsController < ApplicationController

  before_action :load_user, only: :index

  def index
    @reservations = @user.reservations
  end

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to user_reservations_path(current_user.id), notice: "Your reservation is confirmed!"
    else
      flash[:alert] = "Invalid Input!"
      render 'restaurant/show'
    end


  end

  def destroy
  end

  def update
  end

  def edit
  end

  def show
  end

  # def find_reservation
  # @reservation = Reservation.find(params[:id])#code
  # end
  def load_user
    @user = User.find(session[:user_id])
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size)
    #code
  end
end
