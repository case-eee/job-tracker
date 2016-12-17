class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @categories = Category.all
    @company    = Company.find(params[:company_id])
    @job        = Job.new()
  end

  def create
    @categories = Category.all
    @company    = Company.find(params[:company_id])
    @job        = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      @error = "A job must have a Title, level of interest, city, and category!"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @categories = Category.all
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.update(job_params)
    flash[:success] = "You updated #{@job.title} at #{@company.name}"

    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
