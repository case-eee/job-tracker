class CommentsController < ApplicationController
  # refactor

  def index
    @job = Job.find(params[:job_id])
    @company = @job.company
    render('jobs/show')
  end

  def new
    @job = Job.find(params[:job_id])
    @company = @job.company
    @comment = @job.comments.new
  end

  def create
    @job = Job.find(params[:job_id])
    @company = @job.company
    @comment = @job.comments.create(comment_params)
    if @comment.save
      flash[:success] = "You created a comment for the #{@job.title} job at #{@company.name}."
      redirect_to company_job_comment_path(@company, @job, @comment)
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:job_id])
    @company = @job.company
    @comment = Comment.find(params[:id])
  end

  def update
    @job = Job.find(params[:job_id])
    @company = @job.company
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to company_job_comment_path(@company, @job, @comment)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @company = @job.company
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to company_job_path(@company, @job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
