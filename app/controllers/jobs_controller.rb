class JobsController < ApplicationController

  def index
    if params["sort"]
      sort
    else

    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contacts = Contact.all
    @contact = Contact.new
  end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
    @categories = Category.all
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
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id]) # @company.jobs.where(id: params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      @error = @job.errors
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.delete

    flash[:success] = "The #{company.name} #{job.title} position was successfully deleted!"
    redirect_to company_jobs_path(company)
  end

  def sort
    @sorted = Job.group(:city).count("id")
    render :sorted
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
