class JobsController < ApplicationController
  before_action :set_company, only: [:index, :new, :edit, :create, :show]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    # @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    # @company = Company.find(params[:company_id])
    @job = Job.new()
    @categories = Category.all
    @comment = Comment.new(job_id: params[:job_id])
  end

  def create
    # @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    # @comment = @company.jobs.comment.new()
    # @category = @job.category.new(category)
    if @job.save
      # require 'pry'; binding.pry
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
    # @company = Company.find(params[:company_id])
    @categories = Category.all
  end

  def update
     @job.update(job_params)
     if @job.save
       redirect_to company_jobs_path(@job.company, @job)
     else
       render :edit
     end
   end

  def destroy
    @job.destroy
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
