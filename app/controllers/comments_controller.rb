class CommentsController < ApplicationController

  def index
    @comment = Comment.find(params[:id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new()
  end

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    @comment.save

    @job = Job.find(params[:job_id])
    redirect_to company_job_path(@job.company, @job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
