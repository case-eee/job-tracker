class JobsController < ApplicationController
  def index
    @job_by_city  = Job.where(city: params[:location])
    if params[:sort] == "interest"
      @all_jobs = Job.order(level_of_interest: :desc)
      render :interest
    elsif params[:sort] == "location"
      @jobs_by_city = Job.order(:city)
      render :location
    else
      @contact = Contact.new
      @company = Company.find(params[:company_id])
      @jobs    = @company.jobs
      render :index
    end
  end

  def new
    @categories = Category.all
    @company    = Company.find(params[:company_id])
    @job        = Job.new()
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
    @companies = Company.find(params[:company_id])
    @job       = Job.find(params[:id])
    @job_order = Job.find(params[:id]).order_by_time_created
    @comment   = Comment.new
  end

  def edit
    @categories = Category.all
    @company    = Company.find(params[:company_id])
    @job        = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company        = Company.find(params[:id])
    @job            = Job.find(params[:id])
    @job.delete
    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
