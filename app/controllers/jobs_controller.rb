class JobsController < ApplicationController
  before_action :job_finder, only: [:show, :edit, :update, :destroy]
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
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
      @errors = @job.errors.full_messages
      render :new
    end
  end

  def show
    @company = Company.find(@job.company_id)
  end

  def edit
    @company = Company.find(@job.company_id)
  end

  def update
    @company = Company.find(@job.company_id)
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors.full_messages
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to companies_path
  end

  private

    def job_finder
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city)
    end
end
