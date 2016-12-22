class CategoriesController < ApplicationController
  before_action :category_finder, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      @errors = @category.errors.full_messages
      render :new
    end
  end

  def show
    @jobs = @category.jobs
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      @errors = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.jobs.destroy_all
    @category.destroy
    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end


  private
    def category_finder
        @category = Category.find(params[:id])
      end

    def category_params
      params.require(:category).permit(:title)
    end
end
