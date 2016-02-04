class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    
    # if open_seats?(reservation_params[:date], reservation_params[:time], reservation_params[:party_size]) != true
    #   flash[:alert] = "Invalid Input!"
    #   render 'restaurant/show'
    #   return
    # end


 # binding.pry

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
  def open_seats?(date, time, requested_guests)
    counter = 0
    @restaurant.reservations.where(date: date, time: time).find_each do |reservation|
      counter += reservation.party_size.to_i
    end

    @restaurant.capacity - counter >= @reservation.party_size ? true : false
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size)
    #code
  end
end
