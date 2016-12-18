class CommentsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    if @comment.save
      redirect_to company_job_path(@company, @comment.job)
    else
      redirect :new
    end
  end

  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new
  end


  def comment_params
    params.require(:comment).permit(:author, :body)
  end


end
