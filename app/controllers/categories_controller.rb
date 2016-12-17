class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} successfully created!"  
      redirect_to category_path(@category)
    else
      @errors = @category.errors
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "#{@category.title} successfully updated!"
      redirect_to category_path(@category)
    else
      @errors = @category.errors
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "#{@category.title} successfully deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end