class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    render :show
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "You updated #{@category.title}"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def create
    found = Category.find_by(title: category_params["title"])
    if found.nil?
      @category = Category.create(category_params)
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def destroy
    category = Category.find(params[:id])
    @category = category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
