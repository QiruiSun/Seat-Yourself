class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @restaurant.reviews.build(reviews_params)
    @review.user = current_user

    if @review.save
      redirect_to restaurant_path, notice: 'Review has been created successfully!'
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
