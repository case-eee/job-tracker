class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @header = header(:index)
  end

  def new
    @company = Company.new
    @header = header(:new)
    @form = form(:new)
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      @errors = @company.errors.full_messages
      @header = header(:new)
      @form = form(:new)
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
    @job_count = @company.jobs.count
    @header = header(:show)
  end

  def edit
    @company = Company.find(params[:id])
    @header = header(:edit)
    @form = form(:edit)
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      @errors = @company.errors.full_messages
      @header = header(:edit)
      @form = form(:edit)
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

  def header_index
    header = init_hash(false)
    header[:title] = "List of Companies"
    header[:show_add] = true
    return header
  end

  def header_new
    header = init_hash(false)
    header[:title] = "Add a new Company to the list"
    header[:show_index] = true
    return header
  end

  def header_edit
    header = init_hash(false)
    header[:title] = "Edit Company Details"
    header[:show_index] = true
    return header
  end

  def header_show
    header = init_hash(true)
    header[:title] = "Details for "
    header[:show_add] = false
    return header
  end

  def header(route)
    return header_index if route == :index
    return header_new if route == :new
    return header_edit if route == :edit
    return header_show if route == :show
  end

  def form_new
    form = init_hash("")
    form[:submit] = "Save Company Details"
    return form
  end

  def form_edit
    form = init_hash("")
    form[:submit] = "Update Company Details"
    return form
  end

  def form(route)
    return form_new if route == :new
    return form_edit if route == :edit
  end

  def init_hash(value)
    Hash.new(value)
  end
end
