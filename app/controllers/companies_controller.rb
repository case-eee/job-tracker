class CompaniesController < ApplicationController
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
    @company = Company.find(params[:id])
    redirect_to company_jobs_path(@company)
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
    company.destroy

    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end

  def dashboard
    @top_three_companies = find_top_three_by_average
    @jobs_by_level_of_interest = group_jobs_by_level_of_interest
    @jobs_by_location = group_jobs_by_location
    render :dashboard
  end
   
  def find_top_three_by_average
    groups = Company.joins(:jobs).group(:company_id).average("level_of_interest")
    top_three = groups.values.sort.reverse.pop(3)
    top_three.map do |average| 
      pair = {}
      pair[Company.find(groups.key(average))] = average
      pair
    end
  end

  def group_jobs_by_level_of_interest
    Job.all.group(:level_of_interest).count("id")
  end

  def group_jobs_by_location
    Job.all.group(:city).count("id")
  end

  private

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
