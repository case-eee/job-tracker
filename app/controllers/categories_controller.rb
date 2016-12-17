class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @header = header(:index)
  end

  def new
    @category = Category.new
    @header = header(:new)
    @form = form(:new)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      @errors = @category.errors.full_messages
      @header = header(:new)
      @form = form(:new)
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @header = header(:show)
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def header_new
    header = init_hash(false)
    header[:title] = "Create a New Category"
    header[:show_index] = true
    return header
  end

  def header_show
    header = init_hash(true)
    header[:title] = "Details of Category "
    header[:show_add] = false
    return header
  end

  def header_index
    header = init_hash(false)
    header[:title] = "List of All Categories"
    header[:show_add] = true
    return header
  end

  def header(route)
    return header_new if route == :new
    return header_show if route == :show
    return header_index if route == :index
  end

  def form_new
    form = init_hash("")
    form[:submit] = "Save Category"
    return form
  end

  def form(route)
    return form_new if route == :new
  end

  def init_hash(value)
    Hash.new(value)
  end

end