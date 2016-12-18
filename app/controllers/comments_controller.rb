class CommentsController < ApplicationController

  def create 
    @job = Job.find(params[:job_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = @job.id
    if @comment.save
      redirect_to company_job_path(@job.company, @job)
    else
      @comment.errors.full_messages
      render :"jobs/show"
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:content)
  end

end