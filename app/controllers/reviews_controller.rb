class ReviewsController < ApplicationController
  before_action :load_restaurant, only: [:create, :edit, :destroy, :show, :update]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @restaurant.reviews.build(reviews_params)
    @review.user = current_user

    if @review.save
      redirect_to restaurant_path(@restaurant.id), notice: 'Review has been created successfully!'
    else
      render 'restaurant/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def reviews_params
    params.require(:review).permit(:comment, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
