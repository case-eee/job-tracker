class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new()
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @category = Category.new()
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    @category = Category.find_or_create_by(id: params[:category_id])
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comments = @job.comments
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.comments.destroy_all
    job.destroy
    redirect_to company_jobs_path(company)
  end

  def sort
    @payload = Job.payload
    if Job.find_by(city: params[:location])
      @city = params[:location]
      @jobs = Job.where(city: params[:location])
      render :sort_city
    elsif params[:sort] == "interest"
      @jobs = @payload[:sort_by_level_of_interest]
      render :sort_interest
    elsif params[:sort] == "location"
      @cities = @payload[:sort_by_city]
      render :sort_location
    else
      redirect_to dashboard_path
    end

  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
