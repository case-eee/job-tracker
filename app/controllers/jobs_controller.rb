class JobsController < ApplicationController
  include JobsHelper

  before_action :set_company, only: [:new, :edit, :create, :show]
  before_action :set_job,     only: [:show, :edit, :update, :destroy]

  def index
    sort_jobs_by_interest?
    @contact = Contact.new
  end

  def new
    @job = Job.new()
    @categories = Category.all
    @comment = Comment.new(job_id: params[:job_id])
  end

  def create
    @job = @company.jobs.new(job_params)
    create_helper
  end

  def show
    @comment = Comment.new
  end

  def edit
    @categories = Category.all
  end

  def update
    @job.update(job_params)
    update_helper
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end
end
