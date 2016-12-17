class CommentsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to company_job_path(@company, @job)
    else
      @comments = @job.comments
      @errors = @comment.errors
      render "jobs/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end