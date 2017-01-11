class CommentsController < ApplicationController
  def new
    @companies = Comapny.all
    @job       = Job.all
    @comment   = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to company_job_path(@comment.job.company, @comment.job)
    else
      redirect_to company_job_path(@comment.job.company, @comment.job)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end
end
