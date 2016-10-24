class CompaniesController < ApplicationController
  include CompaniesHelper

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    sort_companies_by_city?
    display_only_one_location?
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    create_helper
  end

  def show
    redirect_to company_jobs_path(@company)
  end

  def edit
  end

  def update
    @company.update(company_params)
    update_helper
  end

  def destroy
    @company.delete
    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :city)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
