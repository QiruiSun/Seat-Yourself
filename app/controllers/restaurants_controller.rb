class RestaurantsController < ApplicationController

  # Gets the restaurant object from the number in the url
  before_action :find_restaurant, only: [:edit, :destroy, :show, :update]

  # Creates a Restaurant object for the new restaurant form to use
  def new
    @restaurant = Restaurant.new
  end

  # The controller for the root page of the website.
  def index
    # A collection of all restaurants in the database.
    # Used to display the restaurants on the first page.
    @restaurants = Restaurant.all

    # Takes 6 random categories to display on the first page.
    @categories = Category.all.sample(6)

    # If there is a key named search (meaning user has submitted something in search form)
    # then it will get all objects that contain the word being searched.
    if params[:search]
        @restaurant_search = Restaurant.search(params[:search]).order("created_at DESC")
    end

  end

  # supplies a Restaurant instance variable to edit
  def edit
  end

  # supplies a Restaurant instance variable and then destroys it
  # then redirects to main page
  def destroy

    @restaurant.destroy
    redirect_to restaurants_path

  end

  # supplies a restaurant variable and then updates it based on the params
  # passed in the update form
  # shows the same page again if it does not get updated
  def update

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end

  end

  # shows an individual restaurant page
  def show
    # passes in a new Restaurant instance variable if a user is logged in
    # this variable is used for the form to make a new reservation
    if current_user
      @reservation = Reservation.new
    end

    # also gets a collection of all of the restaurant's reservation if the user is an owner
    if user_is_owner
      @reservations = @restaurant.reservations
    end

  end

  # if user is logged in then they can create a restaurant
  # not sure this page is currently being used because the creation page is in the users page
  def create

    if current_user
      @user = User.find(current_user)
      @restaurant = @user.owned_restaurants.build(restaurant_params)
        if @restaurant.save
        redirect_to restaurants_path
        else
        render :new
        end
    end

  end

  # used as a before action to DRY out code
  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # needed for safe params
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :summary, :open_hour, :close_hour, :capacity)#code
  end
end
