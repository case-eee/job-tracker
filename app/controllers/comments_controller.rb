class CommentsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:job_id])
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    if @comment.save
      flash[:success] = "Comment added."
      redirect_to company_job_path(@comment.job.company, @comment.job)
    else
      flash[:failure] = "A Comment must have an author and content."
      redirect_to new_company_job_comment_path(@comment.job.company, @comment.job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content, :job_id)
  end

end
