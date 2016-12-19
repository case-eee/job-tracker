class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def root
    if params[:sort] == 'location'
      @city_jobs = Job.location
      render :location
    elsif params[:sort] == 'interest'
      @job_interest = Job.job_by_level_of_interest
      render :interest
    elsif params[:location]
      @city = Job.where(city: params[:location])
      render :city
    end
  end

  def new
    @categories = Category.all
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
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @category = category
    @comment = Comment.new
    @comment.job_id = @job.id
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
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_jobs_path(@company)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    flash[:success] = "#{job.title} has been deleted!"
    redirect_to company_jobs_path
  end

  private

  def category
    if @job.category.nil?
      "Not Categorized"
    else
      @job.category.name
    end
  end


  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
