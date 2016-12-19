class JobsController < ApplicationController
  before_action :find_job, only: [:edit, :update, :show, :destroy]
  before_action :find_company, only: [:new, :create, :show, :edit, :update, :destroy]
  
  def index
    if params["location"]
      @jobs = Job.where(city: params[:location])
      render :by_location
    else
      find_company
      @contact = Contact.new
      @jobs = @company.jobs
    end
  end

  def new
    @job = Job.new
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
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      @job.errors.full_messages
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path(@company)
  end

  def find_job
    @job = Job.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
