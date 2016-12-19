class JobsController < ApplicationController
  def sort
    if params[:sort]=="location"
      @jobs_by_city = build_jobs_by_city
      render :location
    elsif params[:sort]=="interest"
      @jobs_by_level_of_interest = build_jobs_by_level_of_interest
      render :interest
    end
  end

  def dashboard
    @count_of_jobs_by_level_of_interest = Job.all.count_by_level_of_interest
    top_x_companies = 3
    @top_companies = build_top_companies(top_x_companies)
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    render('companies/show')
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.create(job_params)
    if @job.save
      flash[:success] = "You added the #{@job.title} job at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find( params[:id] )
    @job.destroy
    redirect_to company_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :sort)
  end
end
