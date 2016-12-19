class JobsController < ApplicationController

  def dashboard
    if params[:sort]
      @sort = params[:sort]
      @jobs = Job.sort_by(@sort)
      render :sorted_jobs
    end
    if params[:location]
      @location = params[:location]
      @jobs = Job.where(city: @location)
      render :location
    end
    @jobs_by_interest = Job.count_by_interest
    @companies_by_interest = Job.companies_by_interest
    @jobs_by_location = Job.count_by_location
  end

  def location
    @location = params[:location]
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contacts = @company.contacts.reverse
    @contact = Contact.new
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
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
    @job = Job.find(params[:id])
    @company = @job.company
    @comments = @job.comments.reverse
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @company = @job.company
    @job.update(job_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @company = @job.company
    @job.destroy
    
    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
