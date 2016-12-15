class JobsController < ApplicationController
  
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    binding.pry
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    redirect_to company_job_path(@company,@job)
  end

  def edit
    # implement on your own!
  end

  def update
    # implement on your own!
  end

  def destroy
    job = Job.find(params[:id])
    company = job.company
    job.destroy
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
