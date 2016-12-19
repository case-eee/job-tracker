require 'page_setup'

class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    if params[:sort]
      @company_jobs = @company.jobs.bycity if params[:sort] == "location"
    else
      @company_jobs = @company.jobs.order("title ASC")
    end
    @page_setup = PageSetup.new(:jobs_index)
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = Job.new()
    @page_setup = PageSetup.new(:jobs_new)
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors.full_messages
      @categories = Category.all
      @page_setup = PageSetup.new(:jobs_new)
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    @job_category = @job.category
    @job_comments = @job.comments.newest_first
    @comment_count = @job_comments.count
    @comment = Comment.new
    @page_setup = PageSetup.new(:jobs_show)
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @categories = Category.all
    @page_setup = PageSetup.new(:jobs_edit)
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} at #{@company.name} updated!"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors.full_messages
      @job = Job.find(params[:id])
      @categories = Category.all
      @page_setup = PageSetup.new(:jobs_edit)
      render :edit
    end
  end

  def destroy
    Job.destroy(params[:id])
    redirect_to company_jobs_path(params[:company_id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

end
