class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:success] = "#{@job.title} was successfully updated"
      redirect_to company_jobs_path(@company)
    else
      render :edit
    end
  end

  def destroy
    title = @job.title
    @job.destroy
    flash[:deleted] = "#{title} was destroyed forever in the fires of Mt. Doom." 
    redirect_to company_jobs_path(@company)
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
