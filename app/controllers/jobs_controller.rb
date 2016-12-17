class JobsController < ApplicationController

  before_action :set_company
  before_action :set_categories, only: [:create, :new, :edit, :update]
  before_action :set_job, only: [:update, :show, :destroy, :edit]

  def index
    @jobs     = @company.jobs
    @contacts = @company.contacts
    @contact  = Contact.new
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
      @errors = @job.errors
      render :new
    end
  end

  def show
    @comments = @job.comments.sort_by {|comment| comment.created_at}
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:success] = "Successfully updated!"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors
      render :edit
    end
  end

  def destroy
    title = @job.title
    @job.destroy
    flash[:success] = "You deleted #{title} at #{@company.name}"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
