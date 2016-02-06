class CategoriesController < ApplicationController


  def index
    @categories = Category.all
  end

  def new
    @category = Categories.new
  end

  def create
    @category = Categories.new(params[:name])
    if @category.save
      redirect_to restaurants_url
    else
      render :new
    end

  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
