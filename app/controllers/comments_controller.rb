class CommentsController < ApplicationController
  def create
    job = Job.find(params[:job][:id])
    company = job.company
    @comment = Comment.new(comment_params)
    @comment.job_id = job.id
    if @comment.save
      redirect_to company_job_path(company, job)
    else
      redirect_to company_job_path(company, job)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    job = @comment.job
    company = job.company
    @comment.destroy
    flash[:success] = "Comment was successfully deleted!"
    redirect_to company_job_path(company, job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
