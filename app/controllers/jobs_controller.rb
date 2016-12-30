class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
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
    @edit_comment = params[:edit_comment] unless params[:edit_comment].nil?
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comment = Comment.new
    @tags = Tag.all - @job.tags
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.update(params[:id] ,job_params)
    @company = Company.find(params[:company_id])
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    @job.destroy

    flash[:success] = "#{@job.title} at #{@company.name} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
