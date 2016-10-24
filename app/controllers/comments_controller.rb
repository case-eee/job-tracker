class CommentsController < ApplicationController
  before_action :set_company_job

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    if @comment.save
      flash[:success] = "Comment added!"
    else
      flash[:error] = "Content can't be blank!"
    end
    redirect_to company_job_path(@company, @job)
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_company_job
    @job = Job.find(params[:job_id])
    @company = Company.find(params[:company_id])
  end

end
