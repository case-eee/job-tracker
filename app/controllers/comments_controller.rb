class CommentsController < ApplicationController
  before_action :require_logged_in
    def index
    @job = Job.find(params[:job_id])
    @comments = @job.comments.order(:created_at)
    render :index
  end

  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new
  end

  def create
    @job = Job.find(params[:job_id])
    if @job.comments.create(comment_params)
      redirect_to company_job_comments_path(@job.company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:job_id])
    @comment = @job.comments
    render :show
  end

  def edit
    @job = Job.find(params[:job_id])
    @comment = @job.comments.find(params[:id])
  end

  def update
    @job = Job.find(params[:job_id])
    @comment = @job.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "You updated the comment for #{@job.title}"
      redirect_to company_job_comments_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:job_id])
    job.comments.find(params[:id]).destroy
    redirect_to company_job_comments_path(job.company, job)
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
