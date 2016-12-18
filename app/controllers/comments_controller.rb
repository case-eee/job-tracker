class CommentsController < ApplicationController
    def index
    @job = Job.find(params[:job_id])
    @comments = @job.comments
    render :index
  end

  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new
  end

  def create
    @job = Job.find(params[:job_id])
    if @job.comments.create(comment_params)
      redirect_to company_job_comment_path(@job.company, @job, @job.comments)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:job_id])
    @comment = @job.comments
    render :show
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
