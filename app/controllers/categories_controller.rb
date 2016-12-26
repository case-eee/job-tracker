class CategoriesController < ApplicationController

  before_action :require_login

  def index
    @categories = Category.all
    @user = User.find(session[:user_id
  end

  def new
    user = User.find(session[:user_id])
    if user.admin.eql?(1)
      @category = Category.new
    else
      flash[:error] = "You are not authorized to view this page"
      render file: 'public/404.html.erb'
    end
  end

  def show
    @category = Category.find(params[:id])
    render :show
  end

  def edit
    user = User.find(session[:user_id])
    if user.admin.eql?(1)
      @category = Category.find(params[:id])
    else
      flash[:error] = "You are not authorized to view this page"
      render file: 'public/404.html.erb'
    end
  end

  def update
    @category = Category.find(params[:id])
    user = User.find(session[:user_id])
    if @category.update(category_params) && user.admin.eql?(1)
      flash[:success] = "You updated #{@category.title}"
      redirect_to category_path(@category)
    elsif user.admin.eql?(1)
      render :edit
    else
      flash[:error] = "You are not authorized to view this page"
      render file: 'public/404.html.erb'
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
    user = User.find(session[:user_id])
    if user.admin.eql?(1)
      category = Category.find(params[:id])
      category = category.destroy
      flash[:success] = "#{category.title} was successfully deleted!"
      redirect_to categories_path
    else
      flash[:error] = "You are not authorized to view this page"
      render file: 'public/404.html.erb'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
