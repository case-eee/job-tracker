class CompaniesController < ApplicationController
  def dashboard
    @sorted_companies = find_top_three_companies
    @jobs_count = Job.group(:city).count("id")
  end

  def find_top_three_companies
    averages = Company.joins(:jobs).group(:company_id).average("level_of_interest")
    top_companies = averages.values.sort.reverse.take(3)
    found = {}
    top_companies.each do |avg|
      found[Company.find(averages.key(avg))] = avg
    end
    found
  end

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    company = Company.find(params[:id])
    redirect_to company_jobs_path(company)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.delete

    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
