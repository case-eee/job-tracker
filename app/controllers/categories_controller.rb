class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end

  def new
    @category = Category.new
    @jobs = Job.all
  end

  def create
    @category = Category.new(category_params)
    @jobs = Job.all
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    @jobs = Job.all
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save(@category)
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private 
  
  def category_params
    params.require(:category).permit(:title, job_ids: [])
  end

end
