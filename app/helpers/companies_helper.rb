module CompaniesHelper
  def sort_companies_by_city?
    if params[:sort]
      @sorted_by_city_note = "Sorted by city alphabetic order:"
      @companies = Company.all.sort_by_city
    else
      @companies = Company.all
    end
  end

  def display_only_one_location?
    if params[:location]
      @sorted_by_city_note = "Jobs in this city:"
      @companies = Company.where(city: params[:location])
    else
      @companies = Company.all
    end
  end

  def create_helper
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def update_helper
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end
end
