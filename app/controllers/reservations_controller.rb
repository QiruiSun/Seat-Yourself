class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @reservation = @restaurant.reservations.build(reservation_params)

    if @restaurant.open_seats?(reservation_params[:date], reservation_params[:time], reservation_params[:party_size]) != true
      flash[:alert] = "Invalid Input!"
      render 'restaurant/show'
      return
    end

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

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size)
    #code
  end
end
