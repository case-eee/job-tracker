class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "Successfully updated!"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    title = @job.title
    @job.delete
    flash[:success] = "You deleted #{title} at #{@company.name}"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
