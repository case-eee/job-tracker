module CompanyHelper
  extend self

  def get_params(params)
    if params[:sort] == "location"
      companies = Company.sorted_companies
    elsif params[:location]
      companies = Company.where(city: params[:location])
    else
      companies = Company.all
    end
  end

  def search_params(params)
    if Company.find_by(name: params["search-id"]).nil?
      message = "Company does not exist"
      redirect_to errors_path
    else
      company = Company.find_by(name: params["search-id"])
      redirect_to company_path(company)
    end
  end

end
