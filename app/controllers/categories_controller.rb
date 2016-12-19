class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New #{@category.title} Category Created!"
      redirect_to categories_path
    else
      @errors = @category.errors
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "The #{category.title} Category was successfully deleted"
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
      if @category.save
        flash[:success] = "#{@category.title} updated!"
        redirect_to categories_path
      else
        @errors = @category.errors
        render :edit
      end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
