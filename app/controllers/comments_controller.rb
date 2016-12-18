class CommentsController < ApplicationController
  before_action :set_job

  def create
    @comment = @job.comments.new(comment_params)
    @comment.save
    redirect_to company_job_path(@comment.job.company, @job)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @company = @comment.job.company
    @comment.destroy
    flash[:deleted] = "That comment has been destroyed forever in the fires of Mt. Doom." 
    redirect_to company_job_path(@comment.job.company, @job)
  end

private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end
end