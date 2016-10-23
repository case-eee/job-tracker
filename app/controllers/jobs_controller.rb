require_relative '../helpers/job_helper'

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, except: [:index]
  before_action :set_comment_contact, only: [:new, :show, :index]

  def index
    @company, @jobs = JobHelper.get_params(params)
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
    @sorted_comments = @job.sorted_comments
    @job.category.nil? ? @category = '' : @category = @job.category.title
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.delete

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id, :tag_list)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_comment_contact
    @comment = Comment.new
    @contact = Contact.new
  end

end
