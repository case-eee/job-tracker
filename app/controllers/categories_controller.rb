class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      flash[:error] = "Please enter a unique category"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    Category.update(params[:id], category_params)
    redirect_to categories_path
  end

  def destroy
    category = Category.find(params[:id])
    category.delete

    flash[:alert] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
