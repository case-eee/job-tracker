class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created #{@category.title} at #{@category.name}"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

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
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end