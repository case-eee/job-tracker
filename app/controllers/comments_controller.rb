require 'page_setup'

class CommentsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @comment = Comment.new(comment_params)
    @job = Job.find(params[:job_id])
    @comment.job = @job
    if @comment.save
      redirect_to company_job_path(params[:company_id], params[:job_id])
    else
      @errors = @comment.errors.full_messages
      @job_category = @job.category
      @job_comments = @job.comments.newest_first
      @comment_count = @job_comments.count
      @comment = Comment.new
      @page_setup = PageSetup.new(:jobs_show)
      render "jobs/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end