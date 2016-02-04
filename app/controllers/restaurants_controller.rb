class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:edit, :destroy, :show, :update]

  def new
    @restaurant = Restaurant.new     #code
  end

  def index
    @restaurants = Restaurant.all   #code
  end

  def edit
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
    #code
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end    #cod
    #code
  end

  def show


    if current_user
      @reservation = @restaurant.reservations.build
    end
    if user_is_owner
      @reservations = @restaurant.reservations

    end
  end

  def create
    if user_is_owner
      @user = User.find(current_user)
      @restaurant = @user.owned_restaurants.build(restaurant_params)

    else
      @restaurant = Restaurant.new(restaurant_params)
    end
      if @restaurant.save
        redirect_to restaurants_path
      else
        render :new
      end

    #code
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :summary, :open_hour, :close_hour, :capacity)#code
  end
end
