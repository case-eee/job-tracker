class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    @job = @comment.job
    @company = @job.company
    if @comment.save
      flash[:success] = "Your created a new comment!"
      redirect_to company_job_path(@company, @job)
    else
    render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
