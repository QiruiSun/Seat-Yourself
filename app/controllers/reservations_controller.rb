class ReservationsController < ApplicationController

  def index

    @reservations = current_user.reservations
    # if current_user.owned_restaurants.any?
    #     @own_restaurant = current_user.owned_restaurants
    # end

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


    if @reservation.save
      redirect_to user_reservations_path(current_user.id), notice: "Your reservation is confirmed!"
    else
      flash[:alert] = "Sorry, too many people!"
      render 'restaurants/show'
    end


  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to users_path
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
  end
  


  private
  def reservation_params
    params.require(:reservation).permit(:time, :party_size)
    #code
  end
end
