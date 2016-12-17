class CommentsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @comment = Comment.new(comment_params)
    @job = Job.find(params[:job_id])
    @comment.job = @job
    if @comment.save
      redirect_to company_job_path(params[:company_id], params[:job_id])
    else
      @errors = @comment.errors.full_messages
      # @job = Job.find(params[:id])
      # @company = Company.find(params[:company_id])
      @job_category = @job.category
      @job_comments = @job.comments.order("created_at DESC")
      @comment = Comment.new
      @header = header(:jobs_show)
      @form = form(:jobs_show)
      # redirect_to company_job_path(@company, @job)
      render "jobs/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def header_jobs_show
    header = init_hash(true)
    header[:title] = "Details for "
    header[:show_add] = false
    header[:show_company_index] = false
    return header
  end

  def header(route)
    return header_jobs_show if route == :jobs_show
  end

  def form_jobs_show
    form = init_hash("")
    form[:submit_comment] = "Save Comment"
    return form
  end

  def form(route)
    return form_jobs_show if route == :jobs_show
  end

  def init_hash(value)
    Hash.new(value)
  end
end