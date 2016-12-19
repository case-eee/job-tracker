class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = @job.id
    if @comment.save
      flash[:success] = "Comment saved!"
      redirect_to company_job_path(@job.company, @job)
    else

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
