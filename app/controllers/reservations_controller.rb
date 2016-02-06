class ReservationsController < ApplicationController

  # /users/:user_id/reservations(.:format)
  def index
    # returns a collection of reservations if there is currently a user signed in
    @reservations = current_user.reservations
    # if current_user.owned_restaurants.any?
    #     @own_restaurant = current_user.owned_restaurants
    # end

  end

  def new
  end

  # /restaurants/:restaurant_id/reservations(.:format)
  def create
    # The reservation creation form is nested within a restaurant show page.
    # First, the current restaurant page must be retrieved.
    @restaurant = Restaurant.find(params[:restaurant_id])

    # If a user is logged in, the Restaurant controller -> show will give a reservation variable
    @reservation = @restaurant.reservations.build(reservation_params)
    # Puts the current_user.id as the user_id in reservation because the form doesn't automatically do it
    @reservation.user = current_user

    # if open_seats?(reservation_params[:date], reservation_params[:time], reservation_params[:party_size]) != true
    #   flash[:alert] = "Invalid Input!"
    #   render 'restaurant/show'
    #   return
    # end

    # if the save is successful then the user is directed to a list of all of their reservations
    # otherwise the restaurant page is shown again
    if @reservation.save
      redirect_to user_reservations_path(current_user.id), notice: "Your reservation is confirmed!"
    else
      flash[:alert] = "Sorry, too many people!"
      render 'restaurants/show'
    end


  end

  # destroys the current reservation, then shows the user page which has a current list of reservations
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

  # don't think this method is still being used
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
