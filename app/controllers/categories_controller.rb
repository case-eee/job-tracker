class CategoriesController < ApplicationController
  include ControllerHelper
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You officially created #{@category.title}"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    attribute  = params[:sort]
    @jobs = sort_by attribute, list
  end

  def edit
  end

  def update
  end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.title} was successfully updated"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    title = @category.title
    @category.destroy
    flash[:deleted] = "The opportunity to be a #{title} has been destroyed forever in the fires of Mt. Doom." 
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :sort)
  end
end