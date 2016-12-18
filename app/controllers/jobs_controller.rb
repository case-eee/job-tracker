class JobsController < ApplicationController
  def index
    # @company = Company.find(params[:company_id])
    # @companies = Company.all
    @jobs = Job.all

    @contact = Contact.new()
    # @contact.company_id = @company.id
    # redirect_to company_jobs_path(@company)
    # @jobs = @company.jobs.find(params[:city])
    @jobs = Job.order(params[:sort])
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
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
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comment = Comment.new()
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @categories = Category.all
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.delete
    flash[:success] = "#{job.title} was successfully deleted!"

    @company = Company.find(params[:company_id])
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
