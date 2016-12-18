class CompaniesController < ApplicationController
  before_action :company_finder, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @categories = Category.all
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      @errors = @company.errors.full_messages
      render :new
    end
  end

  def show
    @contact = Contact.new
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      @errors = @company.errors.full_messages
      render :edit
    end
  end

  def destroy
    @company.destroy

    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private
    def company_finder
        @company = Company.find(params[:id])
      end

    def company_params
      params.require(:company).permit(:name, :city)
    end
end
