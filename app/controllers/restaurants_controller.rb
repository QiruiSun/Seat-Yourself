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
    #code
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
    #code
  end

  def find_restaurant
  @restaurant = Restaurant.find(params[:id])#code
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :summary, :open_hour, :close_hour, :capacity)#code
  end
end
