class CommentsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_job, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    render('jobs/show')
  end

  def new
    @comment = @job.comments.new
  end

  def create
    @comment = @job.comments.create(comment_params)
    if @comment.save
      flash[:success] = "You created a comment for the #{@job.title} job at #{@company.name}."
      redirect_to company_job_comment_path(@company, @job, @comment)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to company_job_comment_path(@company, @job, @comment)
    else
      render :edit
    end
  end

  def destroy
    @comment.delete
    redirect_to company_job_path(@company, @job)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_company
    @company = @job.company
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
