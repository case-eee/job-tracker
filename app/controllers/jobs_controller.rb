class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    if params[:sort]
      @company_jobs = @company.jobs.bycity if params[:sort] == "location"
    else
      @company_jobs = @company.jobs
    end
    @header = header(:index)
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = Job.new()
    @header = header(:new)
    @form = form(:new)
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors.full_messages
      @categories = Category.all
      @header = header(:new)
      @form = form(:new)
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    @job_category = @job.category
    @job_comments = @job.comments.order("created_at DESC")
    @comment_count = @job_comments.count
    @comment = Comment.new
    @header = header(:show)
    @form = form(:show)
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @categories = Category.all
    @header = header(:edit)
    @form = form(:edit)
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} at #{@company.name} updated!"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors.full_messages
      @job = Job.find(params[:id])
      @categories = Category.all
      @header = header(:edit)
      @form = form(:edit)
      render :edit
    end
  end

  def destroy
    Job.destroy(params[:id])
    redirect_to company_jobs_path(params[:company_id])
  end

  def sorted
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def header_index
    header = init_hash(false)
    header[:title] = "List of Available Jobs at "
    header[:show_add] = true
    header[:show_name] = true
    header[:show_company_index] = true
    return header
  end

  def header_show
    header = init_hash(true)
    header[:title] = "Details for "
    header[:show_add] = false
    header[:show_company_index] = false
    return header
  end

  def header_new
    header = init_hash(false)
    header[:title] = "Add a New Job at "
    header[:show_index] = true
    header[:show_name] = true
    return header
  end

  def header_edit
    header = init_hash(false)
    header[:title] = "Edit Job Details"
    header[:show_index] = true
    header[:show_job] = true
    header[:show_name] = true
    return header
  end

  def header(route)
    return header_index if route == :index
    return header_show if route == :show
    return header_new if route == :new
    return header_edit if route == :edit
  end

  def form_new
    form = init_hash("")
    form[:submit] = "Save Job"
    form[:show_categories] = true
    return form
  end

  def form_edit
    form = init_hash("")
    form[:submit] = "Update Job Details"
    form[:show_categories] = true
    return form
  end

  def form_show
    form = init_hash("")
    form[:submit_comment] = "Save Comment"
    return form
  end

  def form(route)
    return form_new if route == :new
    return form_edit if route == :edit
    return form_show if route == :show
  end

  def init_hash(value)
    Hash.new(value)
  end

end
