module CategoriesHelper
  def create_helper
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update_helper
    if @category.save
      redirect_to category_path(@category)
    else
      render :edit
    end
  end 
end
